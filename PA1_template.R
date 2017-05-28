# Set working directory
getwd()
setwd("~/Desktop/coursera")

# Load the data
activity <- read.csv("activity.csv", header = TRUE, sep = ",")

# View the data
dim(activity)
str(activity)
summary(activity)
head(activity)
tail(activity)

# Convert date class to 'Date'
activity$date <- as.Date(as.character(activity$date))
str(activity)

# Mean total number of steps taken per day

##1 Calculate total number of steps per day
stepsPerDay <- aggregate(steps ~ date, activity, sum, na.rm=TRUE)
head(stepsPerDay)
tail(stepsPerDay)

##2 Make a histogram of the total number of steps taken each day
hist(stepsPerDay$steps, border="black", col="grey", breaks=10, xlab="Total Steps", ylab="Frequency of Steps", main = "Total number of Steps each day")

##3 Calculate and report the mean and median of the total number of steps taken per day
mean(stepsPerDay$steps)
median(stepsPerDay$steps)

# What is the average daily activity pattern

##1 Make a time series plot (i.e. 𝚝𝚢𝚙𝚎 = "𝚕") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)

# Calculate the average number of steps
averageSteps <- aggregate(steps ~ interval, activity, mean, na.rm=TRUE)
head(averageSteps)

### Compute the time series plot
plot(averageSteps$interval, averageSteps$steps,  type = "l", col="black", xlab ="Interval", ylab="Average number of steps", main = "Time-series for steps taken")

##2 Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps
averageSteps[which.max(averageSteps$steps),]$interval

# Imputing missing values
##1 Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with 𝙽𝙰s)
length(which(is.na(activity$steps)))

##2 Devise a strategy for filling in all of the missing values in the dataset
options(digits = 2)
activity$newSteps<- ifelse(is.na(activity$steps), mean(activity$steps, na.rm = TRUE), activity$steps)
head(activity, 10)
tail(activity, 10)
length(which(is.na(activity$newSteps)))

##3 Create a new dataset that is equal to the original dataset but with the missing data filled in
newActivity <- activity[,-1]
head(newActivity)
tail(newActivity)

### Calculate total number of steps taken each day 
newStepsPerDay <- aggregate(newSteps ~ date, newActivity, sum, na.rm=TRUE)
head(newStepsPerDay)
tail(newStepsPerDay)
str(newStepsPerDay)

### Convert newSteps to numeric class
newStepsPerDay$newSteps<- numeric(newStepsPerDay$newSteps)

### Make a histogram of the total number of steps taken each day 
hist(newStepsPerDay$newSteps, border="black", col="grey", breaks=10, xlab="Total Steps", ylab="Frequency of Steps", main = "Total number of Steps each day")

# Calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?
mean(newStepsPerDay$newSteps)
median(newStepsPerDay$newSteps)
########### 
#There is no significant impact of imputing missing data on the estimates of the total daily number of steps
###########

# Are there differences in activity patterns between weekdays and weekends?

##1 Create a new factor variable in the dataset with two levels – “weekday” and “weekend” indicating whether a given date is a weekday or weekend day.
head(newActivity$date)
tail(newActivity$date)
newActivity$day <-  ifelse(as.POSIXlt(newActivity$date)$wday %in% c(0,6), 'weekend', 'weekday')
str(newActivity)
newActivity$day <- as.factor(newActivity$day)

##2 Make a panel plot containing a time series plot (i.e. 𝚝𝚢𝚙𝚎 = "𝚕") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis). 

### Load the package

install.packages("ggplot2")
library(ggplot2)

### Calculate the average number of steps
averageNewSteps <- aggregate(newSteps ~ interval + day, newActivity, mean)
head(averageNewSteps)

### Generate the time series plot using 'ggplot' function 
p <- ggplot(averageNewSteps, aes(interval, newSteps)) 
   p + geom_line() + 
    facet_grid(day ~ .) +
    xlab("5-minute interval") + 
    ylab("Average number of steps")+
    ggtitle("Time series plot")