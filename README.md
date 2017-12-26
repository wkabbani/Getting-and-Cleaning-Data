# Getting and Cleaning Data Project

This file explains the content of the repository and how to run the run_analysis.R script.

## Content
1. The original dataset (UCI_HAR_Dataset.zip).
2. The original dataset unzipped (UCI HAR Dataset).
3. The tidy dataset (Cleaned_data.txt).
4. The codebook for the tidy dataset (CodeBook.md).
5. The new independent dataset (new_dataset.txt).

## The script
To run the script use source("run_analysis.R") command in RStudio.
You can optionally change destination file names in the first section of the script.
The script performs the following steps:
1. Sets paths and file names.
2. Downloads and unzip the dataset.
3. Merges the training and the test sets to create one data set.
4. Extracs only the measurements on the mean and standard deviation for each measurement.
5. Sets descriptive activity names to name the activities in the data set.
6. Labels the data set with descriptive variable names.
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.