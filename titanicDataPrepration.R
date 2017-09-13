# Step: 1. Set Directory
getwd()
setwd("/Users/sarmadbatt/Desktop/coursera/shinyLM")

# Step: 2. Load Packages and data files
install.packages("VIM") 
library("VIM")## Visualize missing values
install.packages("DMwR") 
library("DMwR") ## Check missing values among rows
install.packages("rpart") 
library("rpart") ## Predict missing values
install.packages("RColorBrewer") 
library("RColorBrewer") ## Add color to plots
install.packages("ggplot2") 
library("ggplot2") ## Data visualization 
install.packages("gridExtra") 
library("gridExtra") ## Data visualization 
install.packages("stringr") 
library("stringr") ## Perform string operations
install.packages("dplyr")
library("dplyr") ## Data Manuplation
install.packages("pscl") ## Check model performance
library(pscl)
##########Load Data set ############### 
# Dataset was downloaded from Kaggle: https://www.kaggle.com/c/titanic/data
test <- read.csv("test_titanic.csv", na.strings = c("", "NA"), header = TRUE)
train <- read.csv("train_titanic.csv", na.strings = c("", "NA"), header = TRUE)

# Step 3. Prepare data for Analysis
## Check the data summary
str(train)
head(train)
str(test)
head(test)

## Combine two data sets 'test' and 'train'
### Drop first variable from both the data sets
train.drop <- train[,-1]
str(train.drop)
test.drop <- test[,-1]
str(test.drop)

### Add new variable 'survived' to 'test.drop' to combine the data set
test.drop_survived <- data.frame(survived = rep("None"), test.drop)
str(test.drop_survived)
head(test.drop_survived)
tail(test.drop_survived)

### Combine data sets
train.test_combine <- rbind(train.drop, test.drop_survived)
str(train.test_combine)
head(train.test_combine)
tail(train.test_combine)

### Convert the possible variables to the categorical variables
#### Check for the number of values in the variables to get idea of values/levels
sapply(train.test_combine, function(x) length(unique(x)))

#### Convert all the variables with less than 9 values/levels into factors
train.test_combine_fr <- within(train.test_combine, survived <- factor(survived))
train.test_combine_fr <- within(train.test_combine_fr, pclass <- factor(pclass))
train.test_combine_fr <- within(train.test_combine_fr, sibsp <- factor(sibsp))
train.test_combine_fr <- within(train.test_combine_fr, parch <- factor(parch))

## Check the data summary
str(train.test_combine_fr)
head(train.test_combine_fr)
tail(train.test_combine_fr)
summary(train.test_combine_fr)
######################### Observation ##############################
# Variable "age" - 263 missing values 
# Variable "fare" - 1 missing value. Also, there is a huge difference betwee the -
## mean(33.30) and the median (14.46), the third quartile (31.28) and Max.(512.33) -
### which indicates outliers in variable "fare"
# Variable "cabin" - 1014 missing values
# Variable "embarked" - 2 missing values
#####################################################################

### Visualize the outliers in "fare" variable
plot(train.test_combine_fr$fare, xlab = "Fare", ylab = "Frequency")
####################################################################
# Scatter plot shows that most of the fares are till 300 and then there are
# 4 outliers around 500 
####################################################################

####  Convert the outliers into NA (Not available)
train.test_comb_NA <- train.test_combine_fr
train.test_comb_NA$fare[train.test_comb_NA$fare > 300] <- NA
summary(train.test_comb_NA$fare)

### Use "VIM" package to visualize missing values in data set
aggr(train.test_comb_NA)
#####################################################################################
# Graph represents the missing values in variables "age", "fare", "cabin", "embarked" 
#####################################################################################

#### Replace missing values in the data set
##### Use package "DMwR" to check the missing values among rows
summary(train.test_comb_NA)
nrow(train.test_comb_NA[!complete.cases(train.test_comb_NA),])### 1042 values
manyNAs(train.test_comb_NA, 0.2) ### None 
###########################################################################
# There are 1042 NA values in our data set
# None of the rows in the data set has more than 20% missing values 
# We will not drop any of the rows since all the rows are valid in data set
############################################################################

###### Replace 2 missng values in "embarked" variable
summary(train.test_comb_NA$embarked)
plot(train.test_comb_NA$embarked, train.test_comb_NA$fare)
######################################################
# Passengers embarked at - C :270, Q : 123, S: 914
# Since most passengers embarked at S (Southampton)
# Replace the missing values with most frequent value 'S'
#######################################################
train.test_com <- train.test_comb_NA
train.test_com$embarked[is.na(train.test_com$embarked)]  <- "S"
summary(train.test_com)

###### Replace '1014' missing values in "cabin" variable
###############################################################################
# Drop the "cabin" variable as it won't have a significant impact on prediction
###############################################################################
train.test_com <- train.test_com[,-10]
str(train.test_com)
summary(train.test_com)

###### Replace '263' missing values in "age" variable
####### Use package "rpart" to predict missing values
train.test_prd_age <- rpart(age ~ pclass + sex + sibsp + parch + fare + embarked,
 data=train.test_com[!is.na(train.test_com$age),], method="anova")
train.test_com$age[is.na(train.test_com$age)] <- predict(train.test_prd_age, train.test_com[is.na(train.test_com$age),])
summary(train.test_com)

###### Replace '5' missing values in "fare" variable
#Since the data is skewed, we use 'median' to replace the missing values
train.test_com$fare[is.na(train.test_com$fare)] <-median(train.test_com$fare, na.rm=TRUE)
summary(train.test_com)

# Step 4: Analyse the data
## Explore the survival rate
table(train.test_com$survived)

### Use package "RColorBrewer" to add color to plots 
plot(train.test_com$survived, col = brewer.pal (8, "Set2"),  xlab= "Survived" , ylab = "Total Count")

### Plot more  graphs to explore relatoinship between the variables
par(mfrow = c(2,2))
plot(train.test_com$pclass, train.test_com$survived, col = brewer.pal (3, "Set3"), xlab= "Passenger Class" , ylab = "Survived")

plot(train.test_com$embarked, train.test_com$survived,  col = brewer.pal (3, "Set3"), xlab= "Port of Embarkation" , ylab = "Survived")

plot(train.test_com$sibsp, train.test_com$survived,  col = brewer.pal (3, "Set3"), xlab= "Siblings Spouse" , ylab = "Survived")

plot(train.test_com$parch, train.test_com$survived,  col = brewer.pal (3, "Set3"), xlab= "Parent Children" , ylab = "Survived")
## Survival rate is higher among passengers in class 1st ##
## Port of embarkation doesn't seem to impact survival rate ##
## Survival rate seems to vary with size of the family: "sibsip", "parch"##
## Lesser the number of "sibsip" better the survival chances ##

# Use Visualizations to do further analysis
## Use packages "ggplot2" and "gridExtra" for visualization
### Visualize the relation between "pclass" and "survived" 
str(train.test_com)
summary(train.test_com)
p  <- ggplot(train.test_com, aes(pclass, fill = survived))
p + stat_count(width = 1)+ ggtitle ("Passenger Class") + xlab("Passenger Class") + ylab("Total Count") + labs(fill= "survived") 

#### Hypothesis: Survival rate among 1st class was higher
qplot(pclass, age, color = survived, geom = c("boxplot", "jitter"), data = train.test_com)

##### Find out the unique "names" in the data set
length(unique(as.character(train.test_com$name))) ##1307

###### Find two duplicate names in the data set
duplicated.names <- train.test_com[which(duplicated(train.test_com$name)), "name"]

####### Have a look at the duplicate data 
train.test_com[which(train.test_com$name%in%duplicated.names),]

####### Analyse the title "Mr", ""Miss"
####### Use package "stringr" to perform string operations
####### Check if the title has any correlation with other variables
summary(train.test_com)
misses <- train.test_com[which(str_detect(train.test_com$name, "Miss.")),]
misses[1:10,] ## Most of "Miss" are under 18 age ##

######## Hyp: "name title" correlates with "age"
mrs <- train.test_com[which(str_detect(train.test_com$name, "Mrs")),]
mrs[1:10,] ## Most of "Mrs" are between 27 to 40 "age"

######## Check the pattern in males
males <- train.test_com[which(train.test_com$sex=="male"),]
males[1:10,] ## "Mr" title is associated with adult males and "Master" with infants/kids

######### Create a function to extract title & add a new variable "title"
extractTitle <- function(name) {
  name <- as.character(name)
  if (length(grep("Miss.", name)) > 0) { 
    return ("Miss.")
    } else if (length(grep("Mrs.", name)) > 0) {
    return ("Mrs.")
  } else if (length(grep("Mr.", name)) > 0) {
    return ("Mr.")
  } else if (length(grep("Master.", name)) > 0) {
    return ("Master.")
  } else {
    return ("other")
    }
}

titles <- NULL
for (i in 1:nrow(train.test_com)) {
  titles <- c(titles, extractTitle(train.test_com[i, "name"]))
}
train.test_com$title <- as.factor(titles)

## Visualise the relationships using "ggplot2" package
### Visualise the relationship between "title", "pclass" and "survived"
## Since 891 observations have valid data in "survived" variable, we can use only those observations ##
ggplot(train.test_com[1:891,], aes(x= title, fill = survived))+ facet_wrap(~pclass) + geom_bar(width = 0.5) +  ggtitle("Passenger Class") + xlab("Title") + ylab("Total Count") + labs(fill= "survived") 

### Plot "sex" distribution across the train and test data sets
table(train.test_com$sex)
plot(train.test_com$sex, col = "grey", width = 0.5, xlab = "Sex", ylab = "Total Count")

### Plot "title" distribution across the train and test data set
table(train.test_com$title)
plot(train.test_com$title, col = "green", width = 0.5, xlab = "Title", ylab = "Total Count")

### Visualize the relationship of "sex", "pclass" and "survived"
## compare to "title" analysis ##
ggplot(train.test_com[1:891,], aes(x = sex, fill = survived)) +   facet_wrap(~pclass)+ stat_count(width = 0.5) +   ggtitle("Passenger Class") + xlab("Sex") + ylab("Total Count") + labs(fill = "Survived")
##"title", "pclass" and "sex" have impact on predicting "survived" ##
## Master, Miss, Mrs in 1st class have higher chance of surviving ##

### Summarize the "age" variable
summary(train.test_com$age)
summary(train.test_com[1:891,"age"])

### Visualize the survival rates broken out by "sex", "pclass", and "age"
ggplot(train.test_com[1:891,], aes(x = age, fill = survived)) +facet_wrap(~sex + pclass) +geom_histogram(binwidth = 10) +   ggtitle("Passenger Class") + xlab("Age") + ylab("Total Count") + labs(fill = "Survived")
## Most of the passengers who perished where males in their mid age - 20 to 45- travelling in 3rd class ##

### Summarize the "sibsp" variable
summary(train.test_com$sibsp)
str(train.test_com$sibsp)

### Visualize the relatioship of "sibsp", "pclasas", "title" and "survived"
ggplot(train.test_com[1:891,], aes(sibsp, fill = survived)) + facet_wrap(~ pclass + title) + stat_count(width = 1) +   ggtitle("Passenger Class") + xlab("Sibling Spouse") + ylab("Total Count") + labs(fill = "Survived")
## Survival chances decrease with increase in "sibsp" count

### Summarize the "parch" variable
summary(train.test_com$parch)
str(train.test_com$parch)

### Visualize the relatioship between the "parch" and "survived"
ggplot(train.test_com[1:891,], aes(parch, fill = survived)) + facet_wrap(~ pclass + title) + stat_count(width = 1) +   ggtitle("Passenger Class") + xlab("Parent Child") + ylab("Total Count") + labs(fill = "Survived")
## Most of the"parch" count is less than or equal to 3 ##

#### Lets combine "sibsp" and "parch" to get the family size
## Use the orignal data sets "train" & "test" since the "sibsp" and "parch" variables are integers in there ##
str(train)
str(test)
sibsp.temp <- c(train$sibsp, test$sibsp)
parch.temp <- c(train$parch, test$parch)
train.test_com$family.size <- as.factor(sibsp.temp + parch.temp + 1)
str(train.test_com)
train.test_com <- train.test_com[,-c(3, 6:9)]
#write.csv(train.test_com,file = "train.test_com.csv")
###### contrast function 
contrasts(train.test_com$sex)
contrasts(train.test_com$embarked)
contrasts(train.test_com$title)
contrasts(train.test_com$family.size)


titanic <-read.csv("train.test_com.csv", header = TRUE)
summary(titanic)
getwd()
