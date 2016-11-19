## Preliminary step => get the data from the web
# If you already have the files unziped, skip to line 13.
# (make sure you set you working directory to "./data"
# Using relative path "./data" 
# Method "curl" is required for Mac users
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip", method = "curl")

# Extracting the file
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Reading all files into R
# File structure from the original downloaded file was preserved,
# hence the paths "/train" and "/test":
x_train <- read.table("train/X_train.txt", header = FALSE)
x_test <- read.table("test/X_test.txt", header = FALSE)
y_train <- read.table("train/y_train.txt", header = FALSE)
y_test <- read.table("test/y_test.txt", header = FALSE)
subject_train <- read.table("train/subject_train.txt", header = FALSE)
subject_test <- read.table("test/subject_test.txt", header = FALSE)

# Reading the features and activity labels files
activityLabels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

# Adding descriptive names to the columns => makes it easier 
# when merging tables down the road
names(activityLabels) <- c("activityID", "activity")

## Step 1 => merge the training and test sets
# Binding 'train' and 'test' files, then the subject files:
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
s <- rbind(subject_train, subject_test)

# Creating a table with all data 
fullData <- cbind(s,y,x)

## Step2 => Extracting only 'mean' and 'std' measurements

featureNames <- as.character(features$V2) # reads the features as characters
colnames(fullData) <- c("Subject", "activity", featureNames) # change the column names
filteredData <- grep("-mean\\(\\)|-std\\(\\)", colnames(fullData)) # search for mean & std within column names
newData <- fullData[,c(1,2,filteredData)] # creates new dataset with columns 1 (subject), 2 (activity), and the 66 variables selected above

## Step 3  => Using descriptive activity names for the activities
# Replacing integer value (activityID) with its textual description
newData$activity[newData$activity == 1] <- "Walking"
newData$activity[newData$activity == 2] <- "Walking upstairs"
newData$activity[newData$activity == 3] <- "Walking downstairs"
newData$activity[newData$activity == 4] <- "Sitting"
newData$activity[newData$activity == 5] <- "Standing"
newData$activity[newData$activity == 6] <- "Laying"

## Step 4 =>  Giving the dataset descriptive variable names
# At this point, the columns (=variables) already have descriptive names. 
# Here we can fix names so they provide better descriptions of variables.
# Descrptions were based on document "features_info.txt"
names(newData) <- gsub('Acc',"Accel",names(newData))
names(newData) <- gsub('std',"StdDev",names(newData))
names(newData) <- gsub('^t',"Time",names(newData))
names(newData) <- gsub('^f',"Freq",names(newData))
names(newData) <- gsub('mag',"Magnitude",names(newData))

## Step 5 => Creating a second, independent tidy data set
# Using library 'dplyr', which was better explaine throughout the course
library(dplyr)

# Removing the non-numeric values to allow for aggregation
dim(newData) # to find the number of columns (68 in this case)
newDataValues <- newData[, 3:68] # removing the subject and activity columns

# Using aggregate to build a new dataset with the average for all measurements
# Here the values for 'Subject' and 'Activity' are aggreagated to the calculated mean
tidySet <- aggregate(newDataValues, list(Subject = newData$Subject, Activity = newData$activity), mean)

# Writing the file
write.table(tidySet, file="tidy_Dataset.txt", row.names = FALSE)

#####
## To test the file created above:
## (remove #s and execute the one below)
## tidy <- read.table("tidy_Dataset.txt", header = TRUE) 
## header = TRUE is VERY IMPORTANT!!!
