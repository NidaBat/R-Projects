# Code Book
## Human Activity Recognition Using Smartphones Data Set
This code book describes the data sets, variables and the processing required to create the tidy data set.

### Overview
30 volunteers performed 6 different activities while carring a smartphone. The smartphone captured various data about their movements. 
The full description is available at [the Samsung Galaxy Smartphone] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


The output was captured in the [Human Activity Recognition Using Smartphones Data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

After downloading and reading the files from the data set, following data sets were required to get the tiday data set:

### Description of each file

#### Activity files
* y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.
* y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.
* activity_labels.txt: Names and IDs for each of the 6 activities.

#### Subject files
* subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
* subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.

#### Features files
* features.txt: Names of the 561 features.
* X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.
* X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.


