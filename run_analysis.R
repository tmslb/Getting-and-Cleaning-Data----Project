## The aim of this code is to create a tidy R script that does the following:
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


rm(list=ls())
cat("\014")
library(plyr)
library(reshape2)
getwd()

#Download the file

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "Dataset.zip"
if (!file.exists(getwd())) {
  dir.create(getwd())
}
download.file(url, file.path(getwd(), f))
unzip("Dataset.zip")
pathIn <- file.path(getwd(), "UCI HAR Dataset")
list.files(pathIn, recursive = TRUE)

#reading activity labels

activity_Labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_Labels[,2] <- as.character(activity_Labels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract only the data on mean and standard deviation
features_Wanted <- grep(".*mean.*|.*std.*", features[,2])
features_Wanted.names <- features[features_Wanted,2]
features_Wanted.names = gsub('-mean', 'Mean', features_Wanted.names)
features_Wanted.names = gsub('-std', 'Std', features_Wanted.names)
features_Wanted.names <- gsub('[-()]', '', features_Wanted.names)


# merge the train and test data that extracts only the measurements on the mean and standard deviation for each measurement.
train <- read.table("UCI HAR Dataset/train/X_train.txt")[features_Wanted]
train_Activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_Subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train_Subjects, train_Activities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[features_Wanted]
test_Activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_Subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_Subjects, test_Activities, test)
Merged_Data <- rbind(train, test)

#add column labels (appropriately adding descriptive names to the columns)
colnames(Merged_Data) <- c("subject", "activity", features_Wanted.names)

# turn activities & subjects into factors 
Merged_Data$activity <- factor(Merged_Data$activity, levels = activity_Labels[,1], labels = activity_Labels[,2])
Merged_Data$subject <- as.factor(Merged_Data$subject)

Merged_Data.melted <- melt(Merged_Data, id = c("subject", "activity"))
 
# tidy data set can be found below
write.table(Merged_Data.melted, "ucitidy0.txt", row.names = FALSE, quote = FALSE)
write.csv(Merged_Data.melted, "ucitidy0.csv", row.names = FALSE, quote = FALSE)

#From the data set in above step, created a second, independent tidy data set with the average of each variable for each activity and each subject.

Merged_Data.mean <- dcast(Merged_Data.melted, subject + activity ~ variable, mean)

write.table(Merged_Data.mean, "ucitidy.txt", row.names = FALSE, quote = FALSE)
write.csv(Merged_Data.mean, "ucitidy.csv", row.names = FALSE, quote = FALSE)