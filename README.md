# CourseraGettingAndCleaningDataProject
## Coursera Getting and Cleaning Data for Human Activity Recognition Using Smartphones Data Set 
### Class Project for "Getting and Cleaning Data"

* The purpose of the project is to collect "Human Activity Recognition Using Smartphones" data set and clean it. The output is a tidy data set that can be used for later analysis .

* Here are the steps that must be performed before running the R script:

* [Download the zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
* Unzip the file.

* Read all the files mentioned below:

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


Once the above step are completes, run the R script (run_analysis.R). 

The output of the R script is a tidy data set, tidy.csv.

You can read more about the data and the analysis in the [Code Book](https://github.com/NidaBat/CourseraGettingAndCleaningDataProject/edit/master/CodeBook.md).
