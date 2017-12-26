# CodeBook

This file describes the variables, the data, and any transformations or work that I performed to clean up the data of the "Human Activity Recognition Using Smartphones Data Set". 

The dataset is obtained from the following website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## The Variables (Features)

1. The mean and the standard deviation of all the measurements in the original.
|"tBodyAccMeanX"            |"tBodyAccMeanY"            |"tBodyAccMeanZ"            |"tBodyAccStdX"         |   
|"tBodyAccStdY"             |"tBodyAccStdZ"             |"tGravityAccMeanX"         |"tGravityAccMeanY"     |  
|"tGravityAccMeanZ"         |"tGravityAccStdX"          |"tGravityAccStdY"          |"tGravityAccStdZ"      |   
|"tBodyAccJerkMeanX"        |"tBodyAccJerkMeanY"        |"tBodyAccJerkMeanZ"        |"tBodyAccJerkStdX"     |   
|"tBodyAccJerkStdY"         |"tBodyAccJerkStdZ"         |"tBodyGyroMeanX"           |"tBodyGyroMeanY"       |   
|"tBodyGyroMeanZ"           |"tBodyGyroStdX"            |"tBodyGyroStdY"            |"tBodyGyroStdZ"        |   
|"tBodyGyroJerkMeanX"       |"tBodyGyroJerkMeanY"       |"tBodyGyroJerkMeanZ"       |"tBodyGyroJerkStdX"    |   
|"tBodyGyroJerkStdY"        |"tBodyGyroJerkStdZ"        |"tBodyAccMagMean"          |"tBodyAccMagStd"       |   
|"tGravityAccMagMean"       |"tGravityAccMagStd"        |"tBodyAccJerkMagMean"      |"tBodyAccJerkMagStd"   |   
|"tBodyGyroMagMean"         |"tBodyGyroMagStd"          |"tBodyGyroJerkMagMean"     |"tBodyGyroJerkMagStd"  |   
|"fBodyAccMeanX"            |"fBodyAccMeanY"            |"fBodyAccMeanZ"            |"fBodyAccStdX"         |   
|"fBodyAccStdY"             |"fBodyAccStdZ"             |"fBodyAccJerkMeanX"        |"fBodyAccJerkMeanY"    |   
|"fBodyAccJerkMeanZ"        |"fBodyAccJerkStdX"         |"fBodyAccJerkStdY"         |"fBodyAccJerkStdZ"     |   
|"fBodyGyroMeanX"           |"fBodyGyroMeanY"           |"fBodyGyroMeanZ"           |"fBodyGyroStdX"        |   
|"fBodyGyroStdY"            |"fBodyGyroStdZ"            |"fBodyAccMagMean"          |"fBodyAccMagStd"       |   
|"fBodyBodyAccJerkMagMean"  |"fBodyBodyAccJerkMagStd"   |"fBodyBodyGyroMagMean"     |"fBodyBodyGyroMagStd"  |   
|"fBodyBodyGyroJerkMagMean" |"fBodyBodyGyroJerkMagStd"  |                           |                       |

2. The subject who performed the activity for each window sample. 
    - Variable Name: "subject"
    - Values: a range from 1 to 30

3. Activities
    - Variable Name: "activity"
    - Values:
        - WALKING
        - WALKING_UPSTAIRS
        - WALKING_DOWNSTAIRS
        - SITTING
        - STANDING
        - LAYING

## The Data
The cleaned data combines the training and the test data of the original dataset, and adds the label and the subject columns.

## The Transformations
The following transformations have been applied to the original data to produce the cleaned dataset.

01. Merging the training data with the test data.
02. Merging the training labels with the test labels.
03. Merging the training subjects with the test subjects.
04. Extracting only the measurements on the mean and standard deviation for each measurement.
05. Replacing activity numbers with their corresponding text labels.
06. Rename the combined label column to "activity".
07. Rename the combined subject column to "subject".
08. Adjust the names of the mean and std columns (by removing "()", "-", and apply camelcasing).
09. Combine the data, activity, and subject in one data table and save it to a file.
10. Create a new separate dataset which aggregates all the variables using the "mean" function by "activity" and "subjct", and save the new dataset to a file.