# title: run_analysis.R
# author: mkf
# date: 24/05/2020
#
# This script transforms a data set from a Human Activity Recognition database produced by 
# Anguita, D et al. from Smartlab - Non-Linear Complex Systems Laboratory, DITEN - Università 
# degli Studi di Genova, Italy by performing the following actions to produce a tidy data set and 
# outputs a text file (tidyData.txt) containing the data set
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with 
#    the average of each variable for each activity and each subject.

library(dplyr)
library(reshape2)
library(tidyverse)

# Check whether folder containing the data already exists and, if not, download and unzip the data
if (!file.exists("UCI HAR Dataset")) {
  
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  download.file(fileURL, "Dataset.zip", method = "curl")
  
  # Unzip the file into the current working directory
  unzip("Dataset.zip", exdir = ".")
}

# Merge the 'test' and 'training' data sets

test_data <- cbind((read.delim("UCI HAR Dataset/test/subject_test.txt", header = FALSE, 
                            col.names = "subject")),
                (read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, 
                           col.names = "act_id")),
                (read.table("UCI HAR Dataset/test/X_test.txt",  header = FALSE)))


training_data <- cbind((read.delim("UCI HAR Dataset/train/subject_train.txt", header = FALSE, 
                                   col.names = "subject")),
                       (read.delim("UCI HAR Dataset/train/y_train.txt", header = FALSE, 
                                  col.names = "act_id")),
                       (read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)))

all_data <- rbind(test_data, training_data)

# Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("UCI HAR Dataset/features.txt",  row.names = 1, colClasses = "character")

# Select only measurement columns relating to the mean and standard deviation by using
# 'grep' to return the positions of the columns in 'features'
all_data <- select(all_data, subject, act_id, (grep("mean[()]|std[()]", features$V2)+2))


# Use descriptive names to name the activities in the data set

activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("act_id", "activity"), 
                         colClasses = c("numeric","character"))

# Make all activities lowercase & replace '_' with ' ' 
activities$activity <- tolower(activities$activity)
activities$activity <- gsub("_", " ", activities$activity)

# Replace 'act_id' in 'all_data' using  an inner_join with 'activities'
all_data <- inner_join(all_data, activities, by = "act_id", name = "activity")
all_data <- select(all_data, subject, activity, everything())
all_data <- all_data[,-3]

# Label the data set with descriptive variable names

features <- read.table("UCI HAR Dataset/features.txt",  row.names = 1, colClasses = "character")

# Keep only rows with 'mean()' or 'std()' in 'features'
features <- tbl_df(grep("mean[()]|std[()]", features$V2, value = TRUE))

features$value <- gsub("^t", "time-", features$value, ignore.case = FALSE)
features$value <- gsub("^f", "frequency-", features$value, ignore.case = FALSE)
features$value <- gsub("Body", "Body-", features$value, ignore.case = FALSE)
features$value <- gsub("Gravity", "Gravity-", features$value, ignore.case = FALSE)
features$value <- gsub("Acc|Acc-", "Accelerometer-", features$value, ignore.case = FALSE )
features$value <- gsub("Gyro|Gyro-", "Gyroscope-", features$value, ignore.case = FALSE )
features$value <- gsub("Mag[a-zA-Z]|Mag-", "Magnitude-", features$value, ignore.case = FALSE )
features$value <- gsub("mean\\(\\)", "Mean-", features$value, ignore.case = FALSE )
features$value <- gsub("std\\(\\)", "Standard-Deviation-", features$value, ignore.case = FALSE )
features$value <- gsub("X$", "X-Axis", features$value, ignore.case = TRUE )
features$value <- gsub("Y$", "Y-Axis", features$value, ignore.case = TRUE )
features$value <- gsub("-Z$", "Z-Axis", features$value, ignore.case = TRUE )
features$value <- gsub("Jerk", "Jerk-", features$value, ignore.case = FALSE )
features$value <- gsub("--", "-", features$value, ignore.case = FALSE)
features$value <- gsub("-$", "", features$value, ignore.case = FALSE)
features <- rbind("subject", "activity", features)

# Use 'features' to name all the columns in 'all_data' 
names(all_data) <- features$value

# Ccreate an independent tidy data set with the average of each variable for each activity and each subject.

molten_data <- melt(all_data, id.vars = c("subject", "activity"), variable.name = "feature")

tidy_data <- molten_data %>% group_by(subject, activity, feature) %>% summarise(average = mean(value))

# write the tidy data to a text file
write.table(tidy_data, file = "tidyData.txt", row.names = FALSE) 

# N.B. To read the tidyData file, use read.table("tidyData.txt", header = TRUE, check.names = FALSE)

# remove unused objects
rm(activities, all_data, features, molten_data, test_data, training_data)

# End of script



