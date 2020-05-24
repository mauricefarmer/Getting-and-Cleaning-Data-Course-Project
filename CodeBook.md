`{r setup, include=FALSE} knitr::opts_chunk$set(echo = TRUE)`

The data
--------

The data consist of a Human Activity Recognition database built from the
recordings of 30 subjects performing activities of daily living (ADL)
while carrying a waist-mounted smartphone with embedded inertial
sensors. The data is distributed between several ‘.txt’ files and is
zipped series of ‘.txt’ files representing Human Activity Recognition
Using Smartphones Dataset \[^1\]

The authors explain the data as follows:

"the experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually.

The obtained dataset has been randomly partitioned into two sets, where
70% of the volunteers was selected for generating the training data and
30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain."

The data is is downloaded from
<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" class="uri">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

The run\_analysis script downloads a zipped file called ‘Dataset.zip’
and unzips this into a directory called ‘UCI HAR Dataset’ containing the
following files:

-   activity\_labels.txt
-   features\_info.txt
-   features.txt
-   README.txt
-   test/Inertial Signals/body\_acc\_x\_test.txt
-   test/Inertial Signals/body\_acc\_y\_test.txt
-   test/Inertial Signals/body\_acc\_z\_test.txt
-   test/Inertial Signals/body\_gyro\_x\_test.txt
-   test/Inertial Signals/body\_gyro\_y\_test.txt
-   test/Inertial Signals/body\_gyro\_z\_test.txt
-   test/Inertial Signals/total\_acc\_x\_test.txt
-   test/Inertial Signals/total\_acc\_y\_test.txt
-   test/Inertial Signals/total\_acc\_z\_test.txt
-   test/subject\_test.txt
-   test/X\_test.txt
-   test/y\_test.txt
-   train/Inertial Signals/body\_acc\_x\_train.txt
-   train/Inertial Signals/body\_acc\_y\_train.txt
-   train/Inertial Signals/body\_acc\_z\_train.txt
-   train/Inertial Signals/body\_gyro\_x\_train.txt
-   train/Inertial Signals/body\_gyro\_y\_train.txt
-   train/Inertial Signals/body\_gyro\_z\_train.txt
-   train/Inertial Signals/total\_acc\_x\_train.txt
-   train/Inertial Signals/total\_acc\_y\_train.txt
-   train/Inertial Signals/total\_acc\_z\_train.txt
-   train/subject\_train.txt
-   train/X\_train.txt
-   train/y\_train.txt

However, only the following files are used by the script: -
activity\_labels.txt (links the label numbers with their activity name)
- features.txt : contains list of all features - test/subject\_test.txt
: Each row identifies the subject who performed the activity for each
window sample. Its range is from 1 to 30 - test/X\_test.txt : Test data
set - test/y\_test.txt : Test label values - train/subject\_train.txt :
Each row identifies the subject who performed the activity for each
window sample. Its range is from 1 to 30 - train/X\_train.txt : Training
data set - train/y\_train.txt : Training label numbers

Variables
---------

Each record in the original dataset consists of the following
information:

-   Triaxial acceleration from the accelerometer (total acceleration)
    and the estimated body acceleration in X, Y or Z axis and measured
    in units of ‘g’
-   Triaxial Angular velocity from the gyroscope measured in units of
    radians/second
-   A 561-feature vector with time and frequency domain variables
-   An activity label (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS,
    SITTING, STANDING, LAYING)
-   An identifier of the subject who carried out the experiment (between
    1 and 30)

Additional notes:

-   Features are normalized and bounded within \[-1,1\].
-   Each feature vector is a row on the text file.

### Tidy data variables

The variables in the final, tidy, data file are:

subject : An identifier of the subject who carried out the experiment
(value between 1 and 30) activity : An activity label (walking, walking
upstairs, walking downstairs, sitting, standing, laying)

time-Body-Accelerometer-Mean-X-Axis time-Body-Accelerometer-Mean-Y-Axis
time-Body-Accelerometer-Mean-Z-Axis
time-Body-Accelerometer-Standard-Deviation-X-Axis
time-Body-Accelerometer-Standard-Deviation-Y-Axis
time-Body-Accelerometer-Standard-Deviation-Z-Axis
time-Gravity-Accelerometer-Mean-X-Axis
time-Gravity-Accelerometer-Mean-Y-Axis
time-Gravity-Accelerometer-Mean-Z-Axis
time-Gravity-Accelerometer-Standard-Deviation-X-Axis
time-Gravity-Accelerometer-Standard-Deviation-Y-Axis
time-Gravity-Accelerometer-Standard-Deviation-Z-Axis
time-Body-Accelerometer-Jerk-Mean-X-Axis
time-Body-Accelerometer-Jerk-Mean-Y-Axis
time-Body-Accelerometer-Jerk-Mean-Z-Axis
time-Body-Accelerometer-Jerk-Standard-Deviation-X-Axis
time-Body-Accelerometer-Jerk-Standard-Deviation-Y-Axis
time-Body-Accelerometer-Jerk-Standard-Deviation-Z-Axis
time-Body-Gyroscope-Mean-X-Axis time-Body-Gyroscope-Mean-Y-Axis
time-Body-Gyroscope-Mean-Z-Axis
time-Body-Gyroscope-Standard-Deviation-X-Axis
time-Body-Gyroscope-Standard-Deviation-Y-Axis
time-Body-Gyroscope-Standard-Deviation-Z-Axis
time-Body-Gyroscope-Jerk-Mean-X-Axis
time-Body-Gyroscope-Jerk-Mean-Y-Axis
time-Body-Gyroscope-Jerk-Mean-Z-Axis
time-Body-Gyroscope-Jerk-Standard-Deviation-X-Axis
time-Body-Gyroscope-Jerk-Standard-Deviation-Y-Axis
time-Body-Gyroscope-Jerk-Standard-Deviation-Z-Axis
time-Body-Accelerometer-Magnitude-Mean
time-Body-Accelerometer-Magnitude-Standard-Deviation
time-Gravity-Accelerometer-Magnitude-Mean
time-Gravity-Accelerometer-Magnitude-Standard-Deviation
time-Body-Accelerometer-Jerk-Magnitude-Mean
time-Body-Accelerometer-Jerk-Magnitude-Standard-Deviation
time-Body-Gyroscope-Magnitude-Mean
time-Body-Gyroscope-Magnitude-Standard-Deviation
time-Body-Gyroscope-Jerk-Magnitude-Mean
time-Body-Gyroscope-Jerk-Magnitude-Standard-Deviation

frequency-Body-Accelerometer-Mean-X-Axis
frequency-Body-Accelerometer-Mean-Y-Axis
frequency-Body-Accelerometer-Mean-Z-Axis
frequency-Body-Accelerometer-Standard-Deviation-X-Axis
frequency-Body-Accelerometer-Standard-Deviation-Y-Axis
frequency-Body-Accelerometer-Standard-Deviation-Z-Axis
frequency-Body-Accelerometer-Jerk-Mean-X-Axis
frequency-Body-Accelerometer-Jerk-Mean-Y-Axis
frequency-Body-Accelerometer-Jerk-Mean-Z-Axis
frequency-Body-Accelerometer-Jerk-Standard-Deviation-X-Axis
frequency-Body-Accelerometer-Jerk-Standard-Deviation-Y-Axis
frequency-Body-Accelerometer-Jerk-Standard-Deviation-Z-Axis
frequency-Body-Gyroscope-Mean-X-Axis
frequency-Body-Gyroscope-Mean-Y-Axis
frequency-Body-Gyroscope-Mean-Z-Axis
frequency-Body-Gyroscope-Standard-Deviation-X-Axis
frequency-Body-Gyroscope-Standard-Deviation-Y-Axis
frequency-Body-Gyroscope-Standard-Deviation-Z-Axis
frequency-Body-Accelerometer-Magnitude-Mean
frequency-Body-Accelerometer-Magnitude-Standard-Deviation
frequency-Body-Body-Accelerometer-Jerk-Magnitude-Mean
frequency-Body-Body-Accelerometer-Jerk-Magnitude-Standard-Deviation
frequency-Body-Body-Gyroscope-Magnitude-Mean
frequency-Body-Body-Gyroscope-Magnitude-Standard-Deviation
frequency-Body-Body-Gyroscope-Jerk-Magnitude-Mean
frequency-Body-Body-Gyroscope-Jerk-Magnitude-Standard-Deviation

Transformations of the data
---------------------------

This R script, called “run\_analysis.R”, does the following:

1.  Merges the training and the test sets to create one data set
2.  Extracts only the measurements on the mean and standard deviation
    for each measurement
3.  Uses descriptive activity names to name the activities in the data
    set
4.  Appropriately labels the data set with descriptive variable names
5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject.

At the start of the script, libraries needed to transform the data are
loaded:

    library(dplyr)
    library(reshape2)
    library(tidyverse)

The script then checks whether the folder containing the data already
exists and, if not, downloads and unzips the data.

    if (!file.exists("UCI HAR Dataset")) {

      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

      download.file(fileURL, "Dataset.zip", method = "curl")

      # Unzip the file into the current working directory
      unzip("Dataset.zip", exdir = ".")

      rm(fileURL)
    }

The data was first combined into a single data frame by reading in the
test and training data (subject\_test.txt, y\_test.txt and X\_test.txt
files or equivalent ‘train’ files) into seperate data frames and then
combining the data frames into a single ‘all\_data’ data frame as
follows:

    test_data <- cbind((read.delim("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "subject")), (read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE,
    col.names = "act_id")), (read.table("UCI HAR Dataset/test/X_test.txt",  header = FALSE)))

    training_data <- cbind((read.delim("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "subject")), (read.delim("UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names = "act_id")), (read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)))

    all_data <- rbind(test_data, training_data)

    rm(test_data, training_data)

1.  The assignment requires that only the mean and standard deviation
    for each measurement are used for subsequent data transformation.
    The list of measurement names is contianed in ‘features.txt. This
    was read into a the ’features’ object contining 561 elements.

The ‘all\_data’ data frame consists of 10,299 rows and 563 columns:
columns 1 and 2 are ‘subject’ and ‘act\_id’, respectively; the remaining
561 columns are the individual measurements (labelled V1, V2 etc).

To select only measurements relating to mean and standard deviation,
grep() was used on ‘features’ to create a vector of indices of the
columns to retain. The search pattern used selected any element
contining ‘mean()’ or ‘std()’ from ‘features’. This vector was used as
input to the select() funciton which selected the appropraite columns
from ‘all\_data’ (adding ‘2’ to the vector to account for the two
initial rows of ‘all\_data’). Following this, ‘all\_data’ contains
10,299 rows and 68 columns

    features <- read.table("UCI HAR Dataset/features.txt",  row.names = 1, colClasses = "character")

    all_data <- select(all_data, subject, act_id, (grep("mean[()]|std[()]", features$V2)+2))

1.  Descriptive activity names were used to name the activities in the
    data set

Activity names are contained in ‘activity\_labels.txt’ and this was read
into ‘activities’ data frame. The activities were converted to all lower
case and hyphens were replaced by spaces. The activity IDs in
‘all\_data’ were used to select the correct activity name using an
inner\_join (to keep the row order unchanged) and a new column,
‘activity’ was added and moved to the 2nd column position. The ‘act\_id’
column was then removed from ‘all\_data’.

    activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("act_id", "activity"),colClasses = c("numeric","character"))

    activities$activity <- tolower(activities$activity)
    activities$activity <- gsub("_", " ", activities$activity)

    all_data <- inner_join(all_data, activities, by = "act_id", name = "activity")

    all_data <- select(all_data, subject, activity, everything())
    all_data <- all_data[,-3]

1.  The data set was then labelled with descriptive variable names. This
    was acheived by creating a data frame from ‘features’ with items
    contianing ‘mean()’ or ‘std() and assign the values to ’features’,
    then use use gsub() to replace parts of the names with more
    descriptive words seperated by hyphens so that they are more
    readible, replacing as follows:

-   ‘t’ or ‘f’ at start of name with “time-” or “frequency-”,
    respectively
-   Body with Body-
-   Gravity with Gravity-
-   Acc with Accelerometer-  
-   Gyro with Gyroscope-
-   Mag with Magnitude-
-   Jerk with Jerk-
-   mean() and std() replaced with Mean- and Standard-Deviation-,
    respectively
-   replace X, Y and Z at end of name with X-Axis, Y-Axis or Z-Axis
-   any – with -, and remove any trailing ‘-’
-   add ‘subject’ and ‘activity’ to start of ’features

Then use ‘features’ to name all the columns in ‘all\_data’

    features <- tbl_df(grep("mean[()]|std[()]", features$V2, value = TRUE))

    features$value <- gsub("^t", "time-", features$value, ignore.case = FALSE)
    features$value <- gsub("^f", "frequency-", features$value, ignore.case = FALSE)
    features$value <- gsub("Body", "Body-", features$value, ignore.case = FALSE)
    features$value <- gsub("Gravity", "Gravity-", features$value, ignore.case = FALSE)
    features$value <- gsub("Acc|Acc-", "Accelerometer-", features$value, ignore.case = FALSE )
    features$value <- gsub("Gyro|Gyro-", "Gyroscope-", features$value, ignore.case = FALSE )
    features$value <- gsub("Jerk", "Jerk-", features$value, ignore.case = FALSE )
    features$value <- gsub("Mag[a-zA-Z]|Mag-", "Magnitude-", features$value, ignore.case = FALSE )
    features$value <- gsub("mean\\(\\)", "Mean-", features$value, ignore.case = FALSE )
    features$value <- gsub("std\\(\\)", "Standard-Deviation-", features$value, ignore.case = FALSE )
    features$value <- gsub("X$", "X-Axis", features$value, ignore.case = FALSE )
    features$value <- gsub("Y$", "Y-Axis", features$value, ignore.case = FALSE )
    features$value <- gsub("-Z$", "Z-Axis", features$value, ignore.case = FALSE )
    features$value <- gsub("--", "-", features$value, ignore.case = FALSE)
    features$value <- gsub("-$", "", features$value, ignore.case = FALSE)
    features <- rbind("subject", "activity", features)

    colnames(all_data) <- features$value

1.  The final part of the assignment ask that from the data set in step
    4, create a second, independent tidy data set with the average of
    each variable for each activity and each subject.

To achieve this, ‘all\_data’ was transformed from a 10,299 row x 68
column data frame into a 679,734 row x 4 column data frame using the
melt() function, converting the 66 measurement columns into a two new
columns: a ‘feature’ column with the names of the measurement columns as
values, and a ‘value’ column containing the values of each entry in the
origianl column.

The molten data are then used to create a new data frame (‘tidy\_data’)
showing the average of each measurement (variable) for each activity and
subject. Here, the data are grouped y subject, activity and feature in
order to calculate average for each variable (and not simply an average
for all variables for each subject and activity.

    molten_data <- melt(all_data, id.vars = c("subject", "activity"), variable.name = "feature")

    tidy_data <- molten_data %>% group_by(subject, activity, feature) %>% summarise(average = mean(value))

Only the tidy\_data objects is kept

    rm(activities, all_data, features, molten_data)

The tidy data set was writen to a text file

    write.table(tidy_data, file = "tidyData.txt", row.names = FALSE)

To tidyData.txt file can be read usign the following code:

    read.table("tidyData.txt", header = TRUE, check.names = FALSE)

### References

\[^1\] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012.  
\[^2\] Hood, D. (2015) Getting and Cleaning the Assignment \[Blog\]
*thoughtfulbloke blog*. Available at:
<a href="https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/" class="uri">https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/</a>
(Accessed: 13 May 2020).
