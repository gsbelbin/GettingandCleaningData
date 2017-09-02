## This is a script to take two data files, one is a training set and the other is a test set.
## These sets are combined and then cleaned and summarised such that a tidy data set is
## produced.  The data are tidied in accordance with Hadley Wickham’s Tidy Data paper
## (http://vita.had.co.nz/papers/tidy-data.pdf).  The output is a tidy data file entitled
## finalsummarised.txt.  This file may be read back into R using the command
## data <- read.table("finalsummarised.txt", header = TRUE)

## Note that this script requires the dplyr package to be loaded

## Read in the required training data files from the working directory
traindata <- read.table("X_train.txt")
columnnames <- read.table("features.txt")

## Assign the names from the features file to the variables in the training data set
names(traindata) <- columnnames[, 2]

## Read in the subject ie person IDs
subjects <- read.table("subject_train.txt")
names(subjects) <- c("subject")

## Read in the data file for the activity numbers
activities <- read.table("y_train.txt")
names(activities) <- c("activitynumber")

## Combine all the training data into one data frame
traincombined <- cbind(subjects, traindata, activities)

## Read in the activity labels so that activity numbers can be converted to names
activitylabels <- read.table("activity_labels.txt")
names(activitylabels) <- c("activitynumber", "activitylabel")

## Compile the final training data frame
final <- merge(activitylabels,traincombined, by.x = "activitynumber", by.y = "activitynumber")

## Read in the required test data files from the working directory
testdata <- read.table("X_test.txt")
columnnames <- read.table("features.txt")

## Assign the names from the features file to the variables in the test data set
names(testdata) <- columnnames[, 2]

## Read in the subject ie person IDs
subjects <- read.table("subject_test.txt")
names(subjects) <- c("subject")

## Read in the data file for the activity numbers
activities <- read.table("y_test.txt")
names(activities) <- c("activitynumber")

## Combine all the test data into one data frame
testcombined <- cbind(subjects, testdata, activities)

## Compile the final test data frame ready for adding to the training data
temp <- merge(activitylabels, testcombined, by.x = "activitynumber", by.y = "activitynumber")

## Combine the training and test data
final <- rbind(final, temp)

## Create a new data frame which only has the subject IDs, activity labels and any
## columns which have "mean" or "std" in the name
trimmed <- select(final, subject, activitylabel, contains("mean"), contains("std"))

## Clean up the column names so that no unwanted characters remain (in accordance with
## the tidy data requirements)
names(trimmed) <- gsub("-", "", names(trimmed))
names(trimmed) <- gsub(",", "", names(trimmed))
names(trimmed) <- gsub("\\.", "", names(trimmed))
names(trimmed) <- gsub("\\(", "", names(trimmed))
names(trimmed) <- gsub("\\)", "", names(trimmed))

## Group the data ready for summarising
finalgrouped <- group_by(trimmed, subject, activitylabel)

## Summarise by finding the mean of each variable for each subject and activity
finalsummarised <- summarise_at(finalgrouped, vars(tBodyAccmeanX:fBodyBodyGyroJerkMagstd), funs(mean))

##  Append "MEAN" to each column name to emphasise that the data have been averaged
names(finalsummarised)[3:88] <- paste(names(finalsummarised)[3:88],"MEAN", sep = "")

## Output the summarised data to a file called finalsummarised.txt
write.table(finalsummarised, file = "finalsummarised.txt", row.names = FALSE)
