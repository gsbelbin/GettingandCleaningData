## Data Dictionary - Human Activity Recognition Using Smartphones Reduced Dataset

### Variables
SUBJECT				Integer

    Subject (person) ID
                   1 .. 30    .Unique identifier for each subject/person
           
ACTIVITYLABEL		Factor

    Self explanatory descriptive name of activity being carried out
                   LAYING
                   SITTING
                   STANDING
                   WALKING
                   WALKING_DOWNSTAIRS
                   WALKING_UPSTAIRS

### Observation variables
These number variables are named according to the following code:-

angle - The angle between vectors

t-Time domain signals captured at a constant rate of 50 Hz

f-Frequency domain signals produced by the application of a Fast Fourier Transform (FFT)


Body-A body acceleration signal calculated by subtracting the acceleration due to gravity

Gravity-A gravity acceleration signal


Acc-Acceleration signal measured by an accelerometer, measured in standard gravity units,  'g'

Gyro-An angular velocity signal measured by gyroscope, measured in radians per second


Jerk-Signals derived from the body linear acceleration and angular velocity


Mag-Magnitude of the 3-dimensional signals


mean-Mean signal for each measurement

std-Standard deviation of each measurement

meanFreq-Weighted average of the frequency components to obtain a mean frequency


X, Y, Z-These are to indicate the direction of the signal


MEAN-This is appended to every measurement name to emphasise that each 
         	figure is a mean of all the measurements for each subject carrying out
         	each activity


### Example

tBodyAccstdXMEAN-This is the mean of all time domain, body, acceleration, standard
                    deviation in the X direction for a particular subject and activity


### Description of Manipulations to Produce a Tidy Data Set
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
unnecessary characters ie '-', ',', '.', '(', ')'.  A mean for each subject and activity
combination was then calculated and a new data set created.  The text MEAN was appended to
each variable name to emphasise that these are all mean figures.  