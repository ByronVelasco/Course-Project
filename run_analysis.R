#Let's load the required packages.

library(dplyr)
library(reshape2)

#Let's download and unzip all the data required for this project.

dest <- "Final_Project.zip"
if(!file.exists(dest)){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = dest, method = "curl")
}
if(!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

#Let's load the data
#features data:

features <- read.table("./UCI HAR Dataset/features.txt")

#test data:

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",
                     col.names = features[[2]])
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                           col.names = "Subject")

#train data

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",
                      col.names = features[[2]])
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                            col.names = "Subject")

#Activity 1: Merge the training and the test sets to create one data set.
#Let's merge the data

X_data <- rbind(X_train, X_test)
Y_data <- rbind(Y_train, Y_test)
subject_data <- rbind(subject_train, subject_test)
MergedData <- cbind(subject_data, Y_data, X_data)

#Activity 2: Extract only the measurements on the mean and standard deviation 
#for each measurement.

TidyData <- MergedData %>% 
  select(Subject, V1, contains("mean"), contains("std"))

#Activity 3: Use descriptive activity names to name the activities in the data set.

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
TidyData$V1 <- activity_labels[TidyData$V1, 2]

#Activity 4: Appropriately label the data set with descriptive variable names.

names(TidyData) <- gsub("-mean", "Mean", names(TidyData))
names(TidyData) <- gsub("-std", "Std", names(TidyData))
names(TidyData) <- gsub("[-()]", "", names(TidyData))
names(TidyData) <- gsub("^t", "Time", names(TidyData))
names(TidyData) <- gsub("^f", "Frequency", names(TidyData))
names(TidyData) <- gsub("angle", "Angle", names(TidyData))
names(TidyData)[2] <- "Activity"

#Activity 5: From the data set in step 4, create a second, independent tidy data set with the average
#of each variable for each activity and each subject.

#For this let's transform the variables Activity and Subject into factor variables

TidyData$Subject <- factor(TidyData$Subject)
TidyData$Activity <- factor(TidyData$Activity)

SecondTidyData <- TidyData %>%
  group_by(Subject, Activity) %>%
  summarise_all(funs(mean))
write.table(SecondTidyData, "./SecondTidyData.txt", row.name=FALSE)
