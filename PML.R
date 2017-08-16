# Set the working directory
setwd("~/Desktop/coursera")

# Download required libraries
install.packages("caret")
library(caret)
install.packages("randomForest", dependencies = TRUE)
library(randomForest)
install.packages("ggplot2")
library(ggplot2)

# Download files from "Human Activity Recognition" Data Set 
## Check if file already exists
if(!file.exists("./data")){
    dir.create("./data")
}

## Download trian file
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv?accessType=DOWNLOAD"
download.file(fileUrl1, destfile = "./data/pml-training.csv", method = "curl")
dateDownloaded <- date()

## Download test file
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv?accessType=DOWNLOAD"
download.file(fileUrl2, destfile = "./data/pml-testing.csv", method = "curl")
dateDownloaded <- date()

## Read train file
trainingI <- read.csv("./data/pml-training.csv",  stringsAsFactors=FALSE, header = TRUE)

## Summarize the data
str(trainingI)
head(trainingI)
summary(trainingI)
#### Lots of NA values in the columns ####

# Data Cleaning
## Remove first five columns of training data set as its an ID'-Number's and time stamp data
training <- trainingI[, -c(1:7)]
dim(training)

## Remove NearZeroVariance variables (caret package)
nzv_cols <- nearZeroVar(training)
if(length(nzv_cols) > 0) training <- training[, -nzv_cols]
dim(training)

## Remove columns with more than 60% NA values
training <- training[, -which(colMeans(is.na(training)) > 0.6)]
dim(training)
summary(training)

# Partioning the training set into two data sets
inTrain <- createDataPartition(y = training$classe, p = 0.6, list = FALSE)
HARTraining <- training[inTrain,]
str(HARTraining)
HARTesting <- training[-inTrain,]
str(HARTesting)

# Prediction
## HARTesting data set
### Using Random Forest method

set.seed(1234)
cv <- trainControl(method="cv", number=3)
modFit_rf <- train(classe ~.,data=HARTraining, method="rf", trControl=cv, verbose=F)


### Using linear discriminant analysis (lda) method
set.seed(1234)
modFit_lda <- train(classe ~ .,data=HARTraining,method="lda", trControl = cv)


### Predict the `rf` and `lda` models using testing data

prediction_rf <- predict(modFit_rf,newdata=HARTesting)
confusionMatrix(prediction_rf,HARTesting$classe)$overall

prediction_lda <- predict(modFit_lda, newdata = HARTesting)
confusionMatrix(prediction_lda, HARTesting$classe)$overall

pdf("PML_1.pdf",width=6,height=4,paper='special')
qplot(prediction_rf, prediction_lda,color = classe, data = HARTesting)
dev.off()
# Finally, we load the testing data file and predict the result as the following:
## Read test file
testingI <- read.csv("./data/pml-testing.csv",  stringsAsFactors=FALSE, header = TRUE)
str(testingI)
testing <- testingI[,names(testingI) %in% names(HARTraining)] 
predict_result <- predict(modFit_rf, newdata = testing, predict.all = TRUE)




