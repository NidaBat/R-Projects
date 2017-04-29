# Set the working directory
getwd()
setwd("~/Desktop/coursera")

# Download files from "Human Activity Recognition Using Smartphones" Data Set 
## Check if file already exists
if(!file.exists("./data")){
    dir.create("./data")
}

## Download file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/Dataset.zip")

## Unzip dataSet 
unzip(zipfile="./data/Dataset.zip",exdir="./data")

## Reading Activity files
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
dim(y_test)
names(y_test)
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
dim(y_train)
names(y_train)
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
dim(activity_labels)
names(activity_labels)

## Reading Subject files
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
dim(subject_train)
names(subject_train)
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
dim(subject_test)
names(subject_test)

## Reading Features file
features <- read.table('./data/UCI HAR Dataset/features.txt')
dim(features)
names(features)
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
dim(x_train)
names(x_train)
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
dim(x_test)
names(x_test)

# Assigning column names
## Adding column names for features files
colnames(x_train) <- features[,2] 
colnames(x_test) <- features[,2]

## Adding column name for activity files
colnames(y_train) <-"activityId"
colnames(y_test) <- "activityId"

## Adding column name for subject files
colnames(subject_train) <- "subjectId"
colnames(subject_test) <- "subjectId"

## Adding column name for activity labels
colnames(activity_labels) <- c('activityId','activityType')

# Step 1: Merging the training and the test sets to create one data set
merge_train <- cbind(y_train, subject_train, x_train)
dim(merge_train)
merge_test <- cbind(y_test, subject_test, x_test)
dim(merge_test)
combine_data <- rbind(merge_train, merge_test)
names(combine_data)

# Step:2 Extracting only the measurements on the mean and standard deviation 
##  Reading column names
col_names <- colnames(combine_data)
 str(col_names)
 
## Create vector for defining Id, mean and standard deviation
mean_and_std <- (grepl("activityId" , col_names) | 
                     grepl("subjectId" , col_names) | 
                     grepl("mean.." , col_names) | 
                     grepl("std.." , col_names) 
)

## Making nessesary subset from combine_data
subset_mean_std <- combine_data[ , mean_and_std == TRUE]
str(subset_mean_std)

# Step 3: Using descriptive activity names to name the activities in the data set
set_act_names <- merge(subset_mean_std, activity_labels,
                              by='activityId',
                              all.x=TRUE)
str(set_act_names)

# Step 4: Appropriately labeling the data set with descriptive variable names.
names(set_act_names) <- gsub("-|\\(\\)","",tolower(names(set_act_names)))
names(set_act_names)

# Step 5: Creating a second, independent tidy data set with the average of each variable for each activity and each subject

## Making second tidy data set
tidy_set <- aggregate(. ~subjectid + activityid, set_act_names, mean)
tidy_set <- tidy_set[order(tidy_set$subjectid, tidy_set$activityid),]
str(tidy_set)
head(tidy_set)
names(tidy_set)

## Writing second tidy data set in txt file
write.table(tidy_set, "tidy.txt", row.name=FALSE)
