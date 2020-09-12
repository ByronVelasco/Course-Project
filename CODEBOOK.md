#CODEBOOK

For this Course Project, I followed the instructions of five steps:
1. Merged the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set.
4. Appropiately labels the data set with descriptive variable names.
5. From sthe data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

##DETAILS

**Step 1:** Download and unzip the file `UCI HAR Datasetwith the commands `download.file` and `unzip`. Read the tables for this activity: `features`, `X_test`, `Y_test`, `subject_test`, `X_train`, `Y_train`, `subject_train` and `activity_labels`.
Merge the data sets with similar variables: `X_train` with `X_test` into `X_data`, `Y_train` with `Y_test` into `Y_data`, and `subject_train` and `subject_test` into `subject_data`. All these merged data were done with the command `rbind`.
Merge these last datasets with the command `cbind` into the variable `MergedData`.

**Step 2: **From the dataset in `MergedData`, select all the columns but those that do not contain the strings `mean` and `std`, by using the command `select` from `dplyr` package. This new dataset is saved in the variable `TidyData`
This `TidyData` contains the measures about the mean and standard deviation.

**Step 3:**From the dataset in `TidyData` use the `activity_labels` data in order to give the names of each row in the column activity.

**Step 4:**From the dataset in `TidyData` label the columns with descriptive variable names. For this, we use the command `gsub` in order to change specyfic strings to other strings. These changes are:

- `-mean` for `Mean`
- `-std` for `Std`
- `^t` for `Time`
- `^f` for `frequency`
- `angle` for `Angle`

The names of the variables are the following:

 [1] "Subject"                                
 [2] "Activity"                               
 [3] "TimeBodyAcc.mean...X"                   
 [4] "TimeBodyAcc.mean...Y"                   
 [5] "TimeBodyAcc.mean...Z"                   
 [6] "TimeGravityAcc.mean...X"                
 [7] "TimeGravityAcc.mean...Y"                
 [8] "TimeGravityAcc.mean...Z"                
 [9] "TimeBodyAccJerk.mean...X"   
[10] "TimeBodyAccJerk.mean...Y"               
[11] "TimeBodyAccJerk.mean...Z"               
[12] "TimeBodyGyro.mean...X"                  
[13] "TimeBodyGyro.mean...Y"                  
[14] "TimeBodyGyro.mean...Z"  
[15] "TimeBodyGyroJerk.mean...X"              
[16] "TimeBodyGyroJerk.mean...Y"              
[17] "TimeBodyGyroJerk.mean...Z"              
[18] "TimeBodyAccMag.mean.."                  
[19] "TimeGravityAccMag.mean.."               
[20] "TimeBodyAccJerkMag.mean.."              
[21] "TimeBodyGyroMag.mean.."                 
[22] "TimeBodyGyroJerkMag.mean.."             
[23] "FrequencyBodyAcc.mean...X"              
[24] "FrequencyBodyAcc.mean...Y"              
[25] "FrequencyBodyAcc.mean...Z"              
[26] "FrequencyBodyAcc.meanFreq...X"          
[27] "FrequencyBodyAcc.meanFreq...Y"          
[28] "FrequencyBodyAcc.meanFreq...Z"          
[29] "FrequencyBodyAccJerk.mean...X"          
[30] "FrequencyBodyAccJerk.mean...Y"          
[31] "FrequencyBodyAccJerk.mean...Z"          
[32] "FrequencyBodyAccJerk.meanFreq...X"      
[33] "FrequencyBodyAccJerk.meanFreq...Y"      
[34] "FrequencyBodyAccJerk.meanFreq...Z"      
[35] "FrequencyBodyGyro.mean...X"             
[36] "FrequencyBodyGyro.mean...Y"             
[37] "FrequencyBodyGyro.mean...Z"             
[38] "FrequencyBodyGyro.meanFreq...X"         
[39] "FrequencyBodyGyro.meanFreq...Y"         
[40] "FrequencyBodyGyro.meanFreq...Z"         
[41] "FrequencyBodyAccMag.mean.."             
[42] "FrequencyBodyAccMag.meanFreq.."         
[43] "FrequencyBodyBodyAccJerkMag.mean.."     
[44] "FrequencyBodyBodyAccJerkMag.meanFreq.." 
[45] "FrequencyBodyBodyGyroMag.mean.."        
[46] "FrequencyBodyBodyGyroMag.meanFreq.."    
[47] "FrequencyBodyBodyGyroJerkMag.mean.."    
[48] "FrequencyBodyBodyGyroJerkMag.meanFreq.."
[49] "Angle.tBodyAccMean.gravity."            
[50] "Angle.tBodyAccJerkMean..gravityMean."   
[51] "Angle.tBodyGyroMean.gravityMean."       
[52] "Angle.tBodyGyroJerkMean.gravityMean."   
[53] "Angle.X.gravityMean."                   
[54] "Angle.Y.gravityMean."                   
[55] "Angle.Z.gravityMean."                   
[56] "TimeBodyAcc.std...X"                    
[57] "TimeBodyAcc.std...Y"                    
[58] "TimeBodyAcc.std...Z"                    
[59] "TimeGravityAcc.std...X"                 
[60] "TimeGravityAcc.std...Y"                 
[61] "TimeGravityAcc.std...Z"                 
[62] "TimeBodyAccJerk.std...X"                
[63] "TimeBodyAccJerk.std...Y"                
[64] "TimeBodyAccJerk.std...Z"                
[65] "TimeBodyGyro.std...X"                   
[66] "TimeBodyGyro.std...Y"                   
[67] "TimeBodyGyro.std...Z"                   
[68] "TimeBodyGyroJerk.std...X"               
[69] "TimeBodyGyroJerk.std...Y"               
[70] "TimeBodyGyroJerk.std...Z"               
[71] "TimeBodyAccMag.std.."                   
[72] "TimeGravityAccMag.std.."                
[73] "TimeBodyAccJerkMag.std.."               
[74] "TimeBodyGyroMag.std.."                  
[75] "TimeBodyGyroJerkMag.std.."              
[76] "FrequencyBodyAcc.std...X"               
[77] "FrequencyBodyAcc.std...Y"               
[78] "FrequencyBodyAcc.std...Z"               
[79] "FrequencyBodyAccJerk.std...X"           
[80] "FrequencyBodyAccJerk.std...Y"           
[81] "FrequencyBodyAccJerk.std...Z"           
[82] "FrequencyBodyGyro.std...X"              
[83] "FrequencyBodyGyro.std...Y"              
[84] "FrequencyBodyGyro.std...Z"              
[85] "FrequencyBodyAccMag.std.."              
[86] "FrequencyBodyBodyAccJerkMag.std.."      
[87] "FrequencyBodyBodyGyroMag.std.."         
[88] "FrequencyBodyBodyGyroJerkMag.std.." 

**Step 5:** Transform the variables `Subject` and `Activity` into factor variables in order to group them. Use the `group_by` command with the variables `Subject` and `Activity` and `sumarise_all` with the function `mean`.
This table is saved in the variable `SecondTidyData`. Write this dataset with the command `write.table` which contains the tidy dataset for this step.
