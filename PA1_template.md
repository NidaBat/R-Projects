Reproducible Research: Peer Assessment 1
========================================

Set the working directory
-------------------------

    setwd("~/Desktop/coursera")

Load the data
-------------

    activity <- read.csv("activity.csv", header = TRUE, sep = ",")
    head(activity)

    ##   steps       date interval
    ## 1    NA 2012-10-01        0
    ## 2    NA 2012-10-01        5
    ## 3    NA 2012-10-01       10
    ## 4    NA 2012-10-01       15
    ## 5    NA 2012-10-01       20
    ## 6    NA 2012-10-01       25

View the data
-------------

    str(activity)

    ## 'data.frame':    17568 obs. of  3 variables:
    ##  $ steps   : int  NA NA NA NA NA NA NA NA NA NA ...
    ##  $ date    : Factor w/ 61 levels "2012-10-01","2012-10-02",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ interval: int  0 5 10 15 20 25 30 35 40 45 ...

    summary(activity)

    ##      steps                date          interval     
    ##  Min.   :  0.00   2012-10-01:  288   Min.   :   0.0  
    ##  1st Qu.:  0.00   2012-10-02:  288   1st Qu.: 588.8  
    ##  Median :  0.00   2012-10-03:  288   Median :1177.5  
    ##  Mean   : 37.38   2012-10-04:  288   Mean   :1177.5  
    ##  3rd Qu.: 12.00   2012-10-05:  288   3rd Qu.:1766.2  
    ##  Max.   :806.00   2012-10-06:  288   Max.   :2355.0  
    ##  NA's   :2304     (Other)   :15840

Convert date class to 'Date'
----------------------------

    activity$date <- as.Date(as.character(activity$date))

Mean total number of steps taken per day
----------------------------------------

### 1 Calculate total number of steps per day

    stepsPerDay <- aggregate(steps ~ date, activity, sum, na.rm=TRUE)
    head(stepsPerDay)

    ##         date steps
    ## 1 2012-10-02   126
    ## 2 2012-10-03 11352
    ## 3 2012-10-04 12116
    ## 4 2012-10-05 13294
    ## 5 2012-10-06 15420
    ## 6 2012-10-07 11015

### 2 Make a histogram of the total number of steps taken each day

    hist(stepsPerDay$steps, border="black", col="grey", breaks=10, xlab="Total Steps", ylab="Frequency of Steps", main = "Total number of Steps each day")

<img src="PA1_template_files/figure-markdown_strict/fig1-1.png" style="display: block; margin: auto;" />
\#\#\#3 Calculate and report the mean and median of the total number of
steps taken per day

    mean(stepsPerDay$steps)

    ## [1] 10766.19

    median(stepsPerDay$steps)

    ## [1] 10765

What is the average daily activity pattern
------------------------------------------

### 1 Make a time series plot (i.e. 𝚝𝚢𝚙𝚎 = "𝚕") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)

#### Calculate the average number of steps taken

    averageSteps <- aggregate(steps ~ interval, activity, mean, na.rm=TRUE)
    head(averageSteps)

    ##   interval     steps
    ## 1        0 1.7169811
    ## 2        5 0.3396226
    ## 3       10 0.1320755
    ## 4       15 0.1509434
    ## 5       20 0.0754717
    ## 6       25 2.0943396

#### Compute the time series plot

    plot(averageSteps$interval, averageSteps$steps,  type = "l", col="black", xlab ="Interval", ylab="Average number of steps", main = "Time-series for steps taken")

<img src="PA1_template_files/figure-markdown_strict/fig2-1.png" style="display: block; margin: auto;" />
\#\#\#2 Which 5-minute interval, on average across all the days in the
dataset, contains the maximum number of steps

    averageSteps[which.max(averageSteps$steps),]$interval

    ## [1] 835

Imputing missing values
-----------------------

### 1 Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with 𝙽𝙰s)

    length(which(is.na(activity$steps)))

    ## [1] 2304

### 2 Devise a strategy for filling in all of the missing values in the dataset

    options(digits = 2)
    activity$newSteps<- ifelse(is.na(activity$steps), mean(activity$steps, na.rm = TRUE), activity$steps)
    head(activity, 10)

    ##    steps       date interval newSteps
    ## 1     NA 2012-10-01        0       37
    ## 2     NA 2012-10-01        5       37
    ## 3     NA 2012-10-01       10       37
    ## 4     NA 2012-10-01       15       37
    ## 5     NA 2012-10-01       20       37
    ## 6     NA 2012-10-01       25       37
    ## 7     NA 2012-10-01       30       37
    ## 8     NA 2012-10-01       35       37
    ## 9     NA 2012-10-01       40       37
    ## 10    NA 2012-10-01       45       37

### 3 Create a new dataset that is equal to the original dataset but with the missing data filled in

    newActivity <- activity[,-1]
    head(newActivity)

    ##         date interval newSteps
    ## 1 2012-10-01        0       37
    ## 2 2012-10-01        5       37
    ## 3 2012-10-01       10       37
    ## 4 2012-10-01       15       37
    ## 5 2012-10-01       20       37
    ## 6 2012-10-01       25       37

### 4 Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day.

#### Calculate total number of steps taken each day

    newStepsPerDay <- aggregate(newSteps ~ date, newActivity, sum, na.rm=TRUE)
    newStepsPerDay$newSteps<- as.numeric(newStepsPerDay$newSteps)
    head(newStepsPerDay)

    ##         date newSteps
    ## 1 2012-10-01    10766
    ## 2 2012-10-02      126
    ## 3 2012-10-03    11352
    ## 4 2012-10-04    12116
    ## 5 2012-10-05    13294
    ## 6 2012-10-06    15420

#### Make a histogram of the total number of steps taken each day

    hist(newStepsPerDay$newSteps, border="black", col="grey", breaks=10, xlab="Total Steps", ylab="Frequency of Steps", main = "Total number of Steps each day")

<img src="PA1_template_files/figure-markdown_strict/fig3-1.png" style="display: block; margin: auto;" />
\#\#\#\# Calculate and report the mean and median total number of steps
taken per day

    mean(newStepsPerDay$newSteps)

    ## [1] 10766

    median(newStepsPerDay$newSteps)

    ## [1] 10766

. There is no significant impact of imputing missing data on the
estimates of the total daily number of steps

Are there differences in activity patterns between weekdays and weekends?
-------------------------------------------------------------------------

### 1 Create a new factor variable in the dataset with two levels – “weekday” and “weekend” indicating whether a given date is a weekday or weekend day.

    newActivity$day <-  ifelse(as.POSIXlt(newActivity$date)$wday %in% c(0,6), 'weekend', 'weekday')
    newActivity$day <- as.factor(newActivity$day)
    str(newActivity)

    ## 'data.frame':    17568 obs. of  4 variables:
    ##  $ date    : Date, format: "2012-10-01" "2012-10-01" ...
    ##  $ interval: int  0 5 10 15 20 25 30 35 40 45 ...
    ##  $ newSteps: num  37.4 37.4 37.4 37.4 37.4 ...
    ##  $ day     : Factor w/ 2 levels "weekday","weekend": 1 1 1 1 1 1 1 1 1 1 ...

### 2 Make a panel plot containing a time series plot (i.e. 𝚝𝚢𝚙𝚎 = "𝚕") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis).

#### Load the package

    library(ggplot2)

    ## Warning: package 'ggplot2' was built under R version 3.3.2

#### Generate the time series plot using 'ggplot' function

    averageNewSteps <- aggregate(newSteps ~ interval + day, newActivity, mean)
    p <- ggplot(averageNewSteps, aes(interval, newSteps)) 
       p + geom_line() + 
        facet_grid(day ~ .) +
        xlab("5-minute interval") + 
        ylab("Average number of steps")+
        ggtitle("Time series plot")

<img src="PA1_template_files/figure-markdown_strict/fig4-1.png" style="display: block; margin: auto;" />
