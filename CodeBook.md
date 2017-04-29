# Code Book
## Human Activity Recognition Using Smartphones Data Set
This code book describes the data sets, variables and the processing required to create the tidy data set.

### Overview
30 volunteers performed 6 different activities while carring a smartphone. The smartphone captured various data about their movements. 
The full description is available at [the Samsung Galaxy Smartphone](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The output was captured in the [Human Activity Recognition Using Smartphones Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

After downloading and reading the files from the data set, following data sets were required to get the tidy data set:

### [Description of each file is provided in README.md](https://github.com/NidaBat/CourseraGettingAndCleaningDataProject/edit/master/README.md)

### Subject Identifier
This variable takes the value 1-30 representing the subject number in the experiment.

#### "subjectid"

### Activity Identifier
This variable represents the activity of the subjects, when the measurements are taken [6 Activities]. Change from the original dataset by representing the numbers by the corresponding activity name.

#### [1] "activityid"
These represent the activity labels, that will appear in the Activity Identifier

#####  "walking"            "walking_upstairs"   "walking_downstairs"
#####  "sitting"            "standing"           "laying"

Each person performs six activities mentioned above. These are represented as in the tidy data set as {1-6} respectively.

### Measurements: #### Description of the variables in the tidy data set
Finally each of the measurements in the tidy datasets represents an aggregation by mean for each activity and subject accordingly. Measurements representing Subjects 1 Walking activity are the average of all the measurements identified as subject_id = 1 and Activity: Walking.


| Sr No	| Column Name                   |	Description                                                                                 |
|-------| -----------                   | ----------                                                                                  | 
| 1	    | subjectid                     | One of 30 subjects who participated in the experiment	                                      |
| 2	    | activityid                    | One of the 6 activities that subjects perform during the experience	                        |
| 3	    | tbodyaccmeanx                 | mean value for Acceleration time signal for body -X axis	                                  |
| 4	    | tbodyaccmeany	                | mean value for Acceleration time signal for body -Y axis	                                  |
| 5	    | tbodyaccmeanz	                | mean value for Acceleration time signal for body -Z axis	                                  |
| 6	    | tbodyaccstdx	                | Standard Deviation for Acceleration time signal for body -X axis	                          |
| 7	    | tbodyaccstdy	                | Standard Deviation for Acceleration time signal for body -Y axis	                          |
| 8	    | tbodyaccstdz	                | Standard Deviation for Acceleration time signal for body -Z axis	                          |
| 9	    | tgravityaccmeanx	            | mean value for Gravity time signal for body -X axis	                                        |
| 10    | tgravityaccmeany	            | mean value for Gravity time signal for body -Y axis	                                        |
| 11	  | tgravityaccmeanz	            | mean value for Gravity time signal for body -Z axis	                                        |
| 12	  | tgravityaccstdx	              | Standard Deviation for Acceleration time signal for Gravity -X axis	                        |
| 13	  | tgravityaccstdy	              | Standard Deviation for Acceleration time signal for Gravity -Y axis	                        |
| 14	  | tgravityaccstdz	              | Standard Deviation for Acceleration time signal for Gravity -Z axis	                        |
| 15	  | tbodyaccjerkmeanx	            | mean value for Acceleration Jerk signal for body -X axis	                                  |
| 16	  | tbodyaccjerkmeany	            | mean value for Acceleration Jerk signal for body -Y axis	                                  |
| 17	  | tbodyaccjerkmeanz	            | mean value for Acceleration Jerk signal for body -Z axis	                                  |
| 18	  | tbodyaccjerkstdx	            | Standard Deviation for Acceleration Jerk signal for body -X axis	                          |
| 19	  | tbodyaccjerkstdy	            | Standard Deviation for Acceleration Jerk signal for body -Y axis	                          |
| 20	  | tbodyaccjerkstdz	            | Standard Deviation for Acceleration Jerk signal for body -Z axis	                          |
| 21	  | tbodygyromeanx	              | mean value for Gyro time signal for body -X axis	                                          |
| 22	  | tbodygyromeany	              | mean value for Gyro time signal for body -Y axis	                                          |
| 23	  | tbodygyromeanz	              | mean value for Gyro time signal for body -Z axis	                                          |
| 24	  | tbodygyrostdx	                | Standard Deviation for Gyro time signal for body -X axis	                                  |
| 25	  | tbodygyrostdy	                | Standard Deviation for Gyro time signal for body -Y axis	                                  |
| 26	  | tbodygyrostdz	                | Standard Deviation for Gyro time signal for body -Z axis	                                  |
| 27	  | tbodygyrojerkmeanx	          | mean value for Gyro Jerk signal for body -X axis	                                          |
| 28	  | tbodygyrojerkmeany	          | mean value for Gyro Jerk signal for body -Y axis	                                          |
| 29	  | tbodygyrojerkmeanz	          | mean value for Gyro Jerk signal for body -Z axis	                                          |
| 30	  | tbodygyrojerkstdx	            | Standard Deviation for Gyro Jerk signal for body -X axis	                                  |
| 31	  | tbodygyrojerkstdy	            | Standard Deviation for Gyro Jerk signal for body -Y axis	                                  |
| 32	  | tbodygyrojerkstdz	            | Standard Deviation for Gyro Jerk signal for body -Z axis	                                  |
| 33	  | tbodyaccmagmean	              | mean value of the Mangnitude of Acceleration time signal for body	                          |
| 34	  | tbodyaccmagstd	              | Standard Deviation of the Magnitude of Acceleration time signal for body	                  |
| 35	  | tgravityaccmagmean            | mean value of the Mangnitude of Acceleration time signal for gravity	                      |
| 36	  | tgravityaccmagstd	            | Standard Deviation of the Magnitude of Acceleration time signal for gravity	                |
| 37	  | tbodyaccjerkmagmean	          | mean value of the Mangnitude of Acceleration Jerk signal for body	                          |
| 38	  | tbodyaccjerkmagstd	          | Standard Deviation of the Magnitude of Acceleration Jerk signal for body	                  |
| 39	  | tbodygyromagmean	            | mean value of the Mangnitude of Gyro time signal for body	                                  |
| 40	  | tbodygyromagstd	              | Standard Deviation of the Magnitude of Gyro time signal for body	                          |
| 41	  | tbodygyrojerkmagmean	        | mean value of the Mangnitude of Gyro Jerk signal for body	                                  |
| 42	  | tbodygyrojerkmagstd	          | Standard Deviation of the Magnitude of Gyro Jerk signal for body	                          |
| 43	  | fbodyaccmeanx	                | mean value for Acceleration frequency domain signal for body -X axis	                      |
| 44	  | fbodyaccmeany	                | mean value for Acceleration frequency domain signal for body -Y axis	                      |
| 45	  | fbodyaccmeanz	                | mean value for Acceleration frequency domain signal for body -Z axis	                      |
| 46	  | fbodyaccstdx	                | Standard Deviation for Acceleration frequency domain signal for body -X axis	              |
| 47	  | fbodyaccstdy	                | Standard Deviation for Acceleration frequency domain signal for body -Y axis	              |
| 48	  | fbodyaccstdz	                | Standard Deviation for Acceleration frequency domain signal for body -Z axis	              |
| 49	  | fbodyaccmeanfreqx             | Frequency for mean value of Acceleration frequency domain signal for body -Y axis           | 
| 50	  | fbodyaccmeanfreqy             | Frequency formean value of Acceleration frequency domain signal for body -Z axis            | 
| 51	  | fbodyaccmeanfreqz             | Frequency formean value of Acceleration frequency domain signal for body -X axis            | 
| 52	  | fbodyaccjerkmeanx	            | mean value for Acceleration frequency domain Jerk signal for body -X axis	                  |
| 53	  | fbodyaccjerkmeany	            | mean value for Acceleration frequency domain Jerk signal for body -Y axis	                  |
| 54	  | fbodyaccjerkmeanz	            | mean value for Acceleration frequency domain Jerk signal for body -Z axis	                  |
| 55	  | fbodyaccjerkstdx	            | Standard Deviation for Acceleration frequency domain Jerk signal for body -X axis	          |
| 56	  | fbodyaccjerkstdy	            | Standard Deviation for Acceleration frequency domain Jerk signal for body -Y axis	          |
| 57	  | fbodyaccjerkstdz	            | Standard Deviation for Acceleration frequency domain Jerk signal for body -Z axis           | 
| 58	  | fbodyaccjerkmeanfreqx	        | Frequency for mean value of Acceleration frequency domain Jerk signal for body -X axis      |
| 59	  | fbodyaccjerkmeanfreqy	        | Frequency for mean value of Acceleration frequency domain Jerk signal for body -Y axis      |
| 60	  | fbodyaccjerkmeanfreqz	        | Frequency formean value of Acceleration frequency domain Jerk signal for body -Z axis       |
| 61	  | fbodygyromeanx	              | mean value for Gyro frequency domain signal for body -X axis	                              |
| 62	  | fbodygyromeany	              | mean value for Gyro frequency domain signal for body -Y axis	                              |
| 63	  | fbodygyromeanz	              | mean value for Gyro frequency domain signal for body -Z axis	                              |
| 64	  | fbodygyrostdx	                | Standard Deviation for Gyro frequency domain signal for body -X axis	                      |
| 65	  | fbodygyrostdy	                | Standard Deviation for Gyro frequency domain signal for body -Y axis	                      |
| 66	  | fbodygyrostdz	                | Standard Deviation for Gyro frequency domain signal for body -Z axis	                      |
| 67	  | fbodygyromeanfreqx            | Frequency for mean value of Gyro frequency domain signal for body -X axis                   |
| 68	  | fbodygyromeanfreqy            | Frequency for mean value of Gyro frequency domain signal for body -X axis                   |
| 69	  | fbodygyromeanfreqz            | Frequency for mean value of Gyro frequency domain signal for body -X axis                   |
| 70	  | fbodyaccmagmean	              | mean value of the Mangnitude of Acceleration frequency domain signal for body	              |
| 71	  | fbodyaccmagstd	              | Standard Deviation of the Magnitude of Acceleration frequency domain signal for body	      |
| 72	  | fbodyaccmagmeanfreq	          | Frequency for mean value of the Mangnitude of Acceleration frequency domain signal for body |
| 73	  | fbodybodyaccjerkmagmean	      | mean value of the Mangnitude of Acceleration frequency domain signal for body	              |
| 74	  | fbodybodyaccjerkmagstd	      | Standard Deviation of the Magnitude of Acceleration frequency domain signal for body	      |
| 75	  | fbodybodyaccjerkmagmeanfreq	  | Frequency for mean value of the Mangnitude of Acceleration frequency domain signal for body |
| 76	  | fbodybodygyromagmean	        | mean value of the Mangnitude of Gyro frequency domain signal for body	                      |
| 77	  | fbodybodygyromagstd	          | Standard Deviation of the Magnitude of Gyro frequency domain signal for body	              |
| 78	  | fbodybodygyromagmeanfreq	    | Frequency for mean value of the Mangnitude of Gyro frequency domain signal for body         |
| 79	  | fbodybodygyrojerkmagmean	    | mean value of the Mangnitude of Gyro frequency domain signal for body	                      |
| 80	  | fbodybodygyrojerkmagstd	      | Standard Deviation of the Magnitude of Gyro frequency domain signal for body	              |
| 81	  | fbodybodygyrojerkmagmeanfreq  | Frequency formean value of the Mangnitude of Gyro frequency domain signal for body          |
| 82	  | activitytype	                | 1:6 - walking, walking_upstairs, walking_downstairs, sitting, standing, laying              |
