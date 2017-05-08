# Loading data
## Set working directory
getwd()
setwd("~/Desktop/coursera")

## Download files from "Electric power consumption [20Mb]" Data Set 
### Check if file already exists
if(!file.exists("./data")){
    dir.create("./data")
}

### Download file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile= "./data/power_consumption.zip")

### Unzip dataSet 
unzip(zipfile="./data/power_consumption.zip",exdir="./data", overwrite = TRUE)

## 1. Calculating rough estimation of memory required 
### Required memory in MB
memoryRequired <- round(2075259*9*8/2^{20},2) # 142.5 MB
### Required memory in GB
memoryRequired <-round(2075259*9*8/2^{20}/1024, 2) # 0.14 GB

## 2. Read in data from 2007-02-01 and 2007-02-02
powerConsumption<-read.table('data/household_power_consumption.txt',
                             header=TRUE, sep=';',
                             na.strings='?'
)
powerConsumptionSub<- powerConsumption[powerConsumption$Date=='1/2/2007' | powerConsumption$Date=='2/2/2007',]
head(powerConsumptionSub)
tail(powerConsumptionSub)

## 3 Convert the Date and Time variables to Date/Time classes
str(powerConsumptionSub)


# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
powerConsumptionSub$Date <- as.Date(powerConsumptionSub$Date, format="%d/%m/%Y")
powerConsumptionSub$Time <- strptime(powerConsumptionSub$Time, format="%H:%M:%S")
powerConsumptionSub[1:1440,"Time"] <- format(powerConsumptionSub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powerConsumptionSub[1441:2880,"Time"] <- format(powerConsumptionSub[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Making Plots
## Plot 2
plot(powerConsumptionSub$Time,as.numeric(as.character(powerConsumptionSub$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 


## Saving the file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
