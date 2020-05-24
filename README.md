# ReadMe.md

This repository contains files produced in completion of the final project for the Johns Hopkins course Getting and Cleaning Data on Coursera.

The respoitory contains the following files:

- ReadMe.md
- CodeBook.md
- run_analysis.R
- tidyData.txt

## Data set
The data in the repository are part of the "Human Activity Recognition Using Smartphones Dataset" provided by Reyes-Ortiz, J.L, Anguita, D.,  Ghio, A., and Oneto, L. of the Smartlab - Non-Linear Complex Systems Laboratory, DITEN - Università degli Studi di Genova. 

The orignial data can be accessed at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files

* **CodeBook.md** : describes the variables, the data, and all transformations performed to clean up the data to produce a tidy data set. The CodeBook explains in detail how the run_analysis.R script operates

* **run_analysis.R** : an R script that downloads the data set and performs the following transformations:

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Names the activities in the data set using descriptive activity names
  4. Appropriately labels the data set with descriptive variable names
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

* **tidyData.txt** : a text file containing the data set produced in step 5 of run_analysis.R. The data in this file is described in detail in CodeBook.md. The tidyData.txt file can be read usign the following code:
```{r}
    read.table("tidyData.txt", header = TRUE, check.names = FALSE) 
```
* **README.md** : this file, lists the contents of the respository and explains how the files are connected
