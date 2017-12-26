# 1. ============ set paths and file names ============

datasetUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- paste(getwd(), "/UCI_HAR_Dataset.zip", sep = "")
destFolder <- paste(getwd(), "/UCI HAR Dataset", sep = "")

train_data_path <- paste(destFolder, "/train/X_train.txt", sep = "")
train_label_path <- paste(destFolder, "/train/y_train.txt", sep = "")
train_subject_path <- paste(destFolder, "/train/subject_train.txt", sep = "")

test_data_path <- paste(destFolder, "/test/X_test.txt", sep = "")
test_label_path <- paste(destFolder, "/test/y_test.txt", sep = "")
test_subject_path <- paste(destFolder, "/test/subject_test.txt", sep = "")

features_path <- paste(destFolder, "/features.txt", sep = "")
activity_labels_path <- paste(destFolder, "/activity_labels.txt", sep = "")

clean_data_path <- paste(getwd(), "/Cleaned_data.txt", sep = "")
new_dataset_path <- paste(getwd(), "/new_dataset.txt", sep = "")

# 2. ============ download and unzip the dataset ============

# download the zip archive
download.file(datasetUrl, destfile = destFile)  

# unzip
unzip(zipfile=destFile,exdir = getwd())


# 3. ============ Merging the training and the test sets to create one data set. ============

# read training data
train_data <- read.table(train_data_path)
train_labels <- read.table(train_label_path)
train_subjects <- read.table(train_subject_path)

# checking dims
dim(train_data)     # 7352 * 561
dim(train_labels)   # 7352 * 1
dim(train_subjects) # 7352 * 1

# read test data
test_data <- read.table(test_data_path)
test_labels <- read.table(test_label_path)
test_subjects <- read.table(test_subject_path)

# checking dims
dim(test_data)    # 2947 * 561
dim(test_labels)  # 2947 * 1
dim(test_subjects)# 2947 * 1

# merge train and test datasets
merged_data <- rbind(train_data, test_data)
merged_labels <- rbind(train_labels, test_labels)
merged_subjects <- rbind(train_subjects, test_subjects)

# checking dims
dim(merged_data)      # 10299 * 561
dim(merged_labels)    # 10299 * 1
dim(merged_subjects)  # 10299 * 1


# 4. ============ Extracting only the measurements on the mean and standard deviation for each measurement ============

# read the features file and get the indices
features <- read.table(features_path)
mean_std_indices <- grep("mean\\(\\)|std\\(\\)", features[, 2])

# keep only mean and std cols
merged_data <- merged_data[, mean_std_indices]

# checking dims 
dim(merged_data)  # 10299 * 66

# 5. ============ Using descriptive activity names to name the activities in the data set ============

# read activity labels
activity_labels <- read.table(activity_labels_path)

# replace numbers with labels in the merged_labels
merged_labels[, 1] <- activity_labels[merged_labels[ , 1], 2]


# 6. ============ Appropriately labeling the data set with descriptive variable names ============

# naming labels
names(merged_labels) <- "activity"

# naming subjects
names(merged_subjects) <- "subject"

# naming data
names(merged_data) <- features[mean_std_indices, 2]
names(merged_data) <- gsub("-", "", names(merged_data))
names(merged_data) <- gsub("\\(\\)", "", names(merged_data))
names(merged_data) <- gsub("mean", "Mean", names(merged_data))
names(merged_data) <- gsub("std", "Std", names(merged_data))

# bind and save cleaned dataset
cleanData <- cbind(merged_data, merged_labels, merged_subjects)
write.table(cleanData, clean_data_path)


# 7. ============  Creating a second, independent tidy data set with the average of each variable for each activity and each subject ============

# create a new dataset grouped by activity and subject
new_dataset <- aggregate(cleanData[, 1:66], by = list(cleanData$activity, cleanData$subject), FUN = mean)
# adjust the names of the variables
names(new_dataset) <- c("activity", "subject", names(new_dataset)[-1:-2])
# save the new dataset
write.table(new_dataset, new_dataset_path)


