# Course-Project
This is my course project for course Getting and Cleaning Data.

For this project, I followed the following steps:
1. Download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Create the file directory if it does not exist, and unzip the data.
3. Use the command `read.table` in order to read the following data sets: `features`, `X_test`, `Y_test`, `subject_test`, `X_train`, `Y_train`, `subject_train` and `activity_labels`.
4. Merge all the data above into a single table called `MergedData`.
5. In this `MergedData`, select all the columns but those that do not contain the words `mean` and `std`, and save it in the variable `TidyData`.
6. Use descriptive activity names to name the activities in the data set.
7. Appropiately label the data set with descriptive variable names. For this step, it was used the `gsub` command in order to change the names:
I changed `-mean` for `Mean`, `-std` for `Std`, `^t` for `Time`, `^f` for `Frequency`, `angle` for `Angle`. 
8. Finally, from the data set in step 7, create a second, independent tidy data set with the average of each variable for each activity and each subject, and save it as a text file called `SecondTidyData.txt` with the command `write.table`.
Submit in my repository the following files: `CODEBOOK`, `README.md`,  `SecondTidyData` and `run_analysis.R`.
