# You should create one R script called run_analysis.R that does the following.
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the
#    average of each variable for each activity and each subject.

library(dplyr)

# Dowload the data files and unzip into the same dir as this script

#  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#  download.file(fileURL, "Dataset.zip", method = "curl")

# Unzip the file into the current working directory
# unzip("Dataset.zip", exdir = "./")

### Plan - create df with observations, cbind subject data, create subject activity vector and
# then cbind activityc --- Test file with subject x activity x observations

# General

# 1. Create a character vector of observatoion names from features.txt (561 in
# total), removing the row numbers by using read.table

  features <- read.table("UCI HAR Dataset/features.txt", row.names = 1, quote = "\"", comment.char = "", 
    colClasses = "character")

  # Read the 'activity_labels.txt' file and store data in 'activity_labels'
  activity_labels <- read.delim("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = " ")
  names(activity_labels) <- c("act_id", "activity")

##### Test Data #########
  
  # Read in X_test.txt file and name the columns using features
  X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote = "\"", comment.char = "")
  
  # Change the names of the columns using the data in the 'features', converting the data frame 
  # to a vector 
  names(X_test) <- as.vector(features$V2)
  
  # Add a 'status'column to show that these are 'test' data
  X_test$status <- "test"
  
  # Read in 'y_test.txt' file - these relate observations to activities
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, 
                       col.names = "act_id")

  # Add the subject ID numbers to the test data frame from 'subjects_test.txt' file
  test_subjects <- read.delim("UCI HAR Dataset/test/subject_test.txt", header = FALSE, 
                              col.names = "subject_id")

  subject_activity <- cbind(test_subjects, y_test)
  
  subject_activity <- inner_join(subject_activity, activity_labels, by = c("act_id" = "act_id"),
                                 name = "activity")

  # Remove the 'act_id' column from subject_activity
  subject_activity <- subject_activity[,-2]
    
  # Add the subject_id and activity columns to X_test data frame
  X_test <- cbind(X_test, subject_activity)
  
  # Change the column names to remove any invalid characters 
  valid_column_names <- make.names(names=names(X_test), unique = TRUE, allow_ = TRUE)
  names(X_test) <- valid_column_names
  
  # Reorder the columns so that subject_id, status and activity are the first 3 columns
  X_test <- select(X_test, subject_id, status, activity, everything())
  
  
### Training data ###
  
  # Read in X_train.txt file and name the columns using features
  X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote = "\"", comment.char = "")
  
  # Read in 'y_train.txt' file - these relate observations to activities
  y_train <- read.delim("UCI HAR Dataset/train/y_train.txt", header = FALSE, 
                       col.names = "act_id")
  
  # Change the names of the columns using the data in the 'features', converting the data frame 
  # to a vector 
  names(X_train) <- as.vector(features$V2)
  
  # Add a 'status'column to show that these are 'test' data
  X_train$status <- "training"
  
  
  # Add the subject ID numbers to the test data frame from 'subjects_test.txt' file
  training_subjects <- read.delim("UCI HAR Dataset/train/subject_train.txt", header = FALSE, 
                              col.names = "subject_id")
  
  subject_activity <- cbind(training_subjects, y_train)
  
  subject_activity <- inner_join(subject_activity, activity_labels, by = c("act_id" = "act_id"),
                                 name = "activity")
  
  # Remove the 'act_id' column from subject_activity
  subject_activity <- subject_activity[,-2]
  
  # Add the subject_id and activity columns to X_test data frame
  X_train <- cbind(X_train, subject_activity)
  
  # Change the column names to remove any invalid characters 
  valid_column_names <- make.names(names=names(X_train), unique = TRUE, allow_ = TRUE)
  names(X_train) <- valid_column_names
  
  # Reorder the columns so that subject_id, status and activity are the first 3 columns
  X_train <- select(X_train, subject_id, status, activity, everything())
  
  # Merge the test and training data into a single data frame
  merged_data <- merge(X_test, X_train, all = TRUE)
  
  