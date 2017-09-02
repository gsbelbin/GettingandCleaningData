## Read Me File for the Getting and Cleaning Data Assignment

### Description of Analysis Script
The data were read from the files X_train.txt, features.txt, subject_train.txt, y_train.txt,
activity_labels.txt, X_test.txt, subject_test.txt and y_test.txt.  The two sets of data
(train and test) were essentially the same but for different subjects and required to be
combined and tidied.  The operations for each set were therefore the same prior to the
combination.  The following describes how the train data set was dealt with but this applies
to the test data set also.  The data file X_train.txt was first read in to R Studio and the
variable headings were added from the features.txt file.  The IDs of the subjects and the
activity numbers were then read from the subjects_train.txt and y_train.txt files and added
as new columns to the existing data.  The file activity_labels.txt was then read in and used
with the merge function to convert the activity numbers in the main data set into activity
names.  The above tasks were then repeated for the test data and the two data sets were
combined.  Columns not containing the text "mean" or "std" were then removed since these
were not required for this task.  The column names were then cleaned to remove any extra,
unnecessary characters ie '-', ',', '.', '(', ')'.  These characters can cause certain R
functions to fail.  A mean for each subject and activity combination was then calculated
and a new data set created.  The text MEAN was appended to each variable name to emphasise
that these are all mean figures.

The output is a file called finalsummarised.txt containing the tidy data set.  Note that
all the input files (X_train.txt, features.txt, subject_train.txt, y_train.txt,
activity_labels.txt, X_test.txt, subject_test.txt and y_test.txt) must be placed in the
R working directory prior to running the script and the dplyr package must be loaded.

### Choice of Variable Names
Descriptive names for the features variables were just taken as the given names without the
extra punctuation since this punctuation can cause issues with some R functions.  The
chosen names include all the detail required to identify their meanings as described in
the code book.  Features/variables containing the text "mean" or "std" were taken to be
mean or standard deviation measurements and so were included in the reduced data frame.

### Data Tidiness
The data have been tidied in accordance with Hadley Wickham’s Tidy Data
paper (http://vita.had.co.nz/papers/tidy-data.pdf).  The requirements for this are:-

1.  Each variable you measure should be in one column
2.  Each different observation of that variable should be in a different row
3.  There should be one table for each “kind” of variable
4.  If there are multiple tables, they should include a column in the table that allows
    them to be linked

For the resulting data set, requirement 1 is met since there is only 1 measurement
in each column.  Requirement 2 is met since each row has the mean measurement
for each combination of subject and activity.  Requirements 3 and 4 are met automatically
since we have only one table.

