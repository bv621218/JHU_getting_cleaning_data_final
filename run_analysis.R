## ---------------------------
##
## Script name: run_analysis
##
## Purpose of script:
##
## Author: Bryan Vengelen
##
## Date Created: 3/22/2020
##
## Email: bryan.vengelen@gmail.com
##
## ---------------------------
##
##  Working Directory, File Paths and Packages, Download Data Zipfile
##
## ---------------------------

#change this file path to reflect your directory path.
wd1<- "C:/Users/bryan/OneDrive/Documents/GitHub/JHU_getting_cleaning_data_final"
setwd(wd1)

fileName<- "JHU_GACD_FinalProject_Raw.zip"
url<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
packages<- c("dplyr", "data.table", "sqldf", "vtable")
lapply(packages, require, character.only = TRUE)

download.file(url, fileName, method = "curl")
unzip(fileName, overwrite = TRUE)
setwd("./UCI HAR Dataset")
## ---------------------------
##
##  Step 1: Read in datasets and preliminary clean up
##
## ---------------------------

activityLabels<- read.table("activity_labels.txt",
                            stringsAsFactors = FALSE,
                            col.names = c("activity_index", "activity"))

features<- read.table("features.txt", 
                      stringsAsFactors = FALSE, 
                      col.names = c("feature_index", "feature"))

# Training Data
train.X<- read.table(file.path(getwd(), "train", "X_train.txt"), col.names = features$feature)
train.Y<- read.table(file.path(getwd(), "train", "y_train.txt"), col.names = c("activity_index"))
train.subject<- read.table(file.path(getwd(), "train", "subject_train.txt"), col.names = c("subject"))
training<- cbind(train.subject, train.Y, train.X)

# Test Data
test.X<- read.table(file.path(getwd(), "test", "X_test.txt"), col.names = features$feature)
test.Y<- read.table(file.path(getwd(), "test", "y_test.txt"), col.names = c("activity_index"))
test.subject<- read.table(file.path(getwd(), "test", "subject_test.txt"), col.names = c("subject"))
testing<- cbind(test.subject, test.Y, test.X)

## ---------------------------
##
##  Step 1: Merge training and Test datasets
##
## ---------------------------

allData<- rbind(training, testing)

## ---------------------------
##
##  Step 2: Subset to only the 
##          columns with measures 
##          of mean and standard deviation
##
## ---------------------------

subsetData<- select(allData, subject, activity_index, contains("mean"), contains("std"))

## ---------------------------
##
##  Step 3: Apply activity Labels
##
## ---------------------------

subsetData<- select(select(merge(subsetData, activityLabels, by = "activity_index"), 
                    subject, activity,  everything()), -activity_index)

## ---------------------------
##
##  Step 4: Apply appropriate column names
##
## ---------------------------
columnNames<- names(subsetData)
columnNames <- gsub("[\\(\\)-]", "", columnNames)

# expand abbreviations and clean up names
columnNames <- gsub("mean", "Mean", columnNames)
columnNames <- gsub("std", "STD", columnNames)
columnNames <- gsub("^f", "frequencyDomain", columnNames)
columnNames <- gsub("^t", "timeDomain", columnNames)
columnNames <- gsub("BodyBody", "Body", columnNames)
columnNames <- gsub("Acc", "Accelerometer", columnNames)
columnNames <- gsub("Gyro", "Gyroscope", columnNames)
columnNames <- gsub("Mag", "Magnitude", columnNames)
columnNames <- gsub("Freq", "Freq", columnNames)
names(subsetData)<- columnNames

## ---------------------------
##
##  Step 5: Calulate means of every variable 
##          by subject and activity,
##          write this data to tidy.txt file
##
## ---------------------------
setwd(wd1)
tidyData<- subsetData %>%
            group_by(subject, activity)%>%
            summarise_all(list(mean= mean))
varListing<- data.frame(vtable(tidyData, "return", values = FALSE, class = TRUE ))
write.table(tidyData, "tidy_data.txt", row.names = FALSE)
