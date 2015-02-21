#Code book for data and processes used in run_analysis.R script.

###The run_analysis.R script aggregates and merges data from the following files:
- activity_labels.txt
- features.txt
- subject_train.txt
- subject_test.txt
- x_train.txt
- x_test.txt
- y_train.txt
- y_test.txt

###The msObsvData and msObsvDataMeans data frames are created through the following steps.
- get the activity names from the activity_labels.txt file 
- get the feature (column) names for the variable measurements from the features.txt file. 
- read the subject_train.txt and subject_test.txt files into data frames subjectTrn and subjectTst, respectively.
- create subjectData data frame by appending subjectTst to subjectTrn
- rename column(s) of subjectData data frame to descriptive 'subjectNum' name.
- read the y_train.txt and y_test.txt files into data frames activityTrn and activityTst, respectively.
- create activityData data frame by appending activityTst to activityTrn
- rename activityData column name to descriptive 'activityNum' name.
- read the x_train.txt and x_test.txt files into obsvTrn and obsvTst data frames, respectively.
- create the obsvData data frame by appending obsvTst to obsvTrn
- rename columns in the obsvData data frame to correspond to featureName variables in features data frame.
- create the msObsvData data frame by extracting only the columns with the strings 'mean' or 'std' in the column name.
- the columns in subjectData and activityData are then bound to the msObsvData data frame using the cbind() function.
- activity labels are then added to the msObsvData frame by merging the activityLabels and msObsvData data frames on the activityNum column.
- the activityNum column is then dropped from the msObsvData data frame, resulting in the finished msObsvData data frame.
- the msObsvDataMeans data frame is created by grouping the msObsvData data frame along the activityDesc and subjectNum columns and then calculating the means by group for the remaining columns.

###list of columns for the 'msObsvData' data frame created by run_analysis.R script

- activityDesc: Description of activity
- subjectNumber: Subject ID number
- tBodyAcc-mean()-X: 
- tBodyAcc-mean()-Y               
- tBodyAcc-mean()-Z               
- tBodyAcc-std()-X               
- tBodyAcc-std()-Y                
- tBodyAcc-std()-Z                
- tGravityAcc-mean()-X            
- tGravityAcc-mean()-Y           
- tGravityAcc-mean()-Z            
- tGravityAcc-std()-X             
- tGravityAcc-std()-Y             
- tGravityAcc-std()-Z            
- tBodyAccJerk-mean()-X          
- tBodyAccJerk-mean()-Y           
- tBodyAccJerk-mean()-Z           
- tBodyAccJerk-std()-X           
- tBodyAccJerk-std()-Y            
- tBodyAccJerk-std()-Z            
- tBodyGyro-mean()-X              
- tBodyGyro-mean()-Y             
- tBodyGyro-mean()-Z              
- tBodyGyro-std()-X               
- tBodyGyro-std()-Y               
- tBodyGyro-std()-Z              
- tBodyGyroJerk-mean()-X          
- tBodyGyroJerk-mean()-Y          
- tBodyGyroJerk-mean()-Z          
- tBodyGyroJerk-std()-X          
- tBodyGyroJerk-std()-Y           
- tBodyGyroJerk-std()-Z           
- tBodyAccMag-mean()              
- tBodyAccMag-std()            
- tGravityAccMag-mean()           
- tGravityAccMag-std()            
- tBodyAccJerkMag-mean()         
- tBodyAccJerkMag-std()          
- tBodyGyroMag-mean()             
- tBodyGyroMag-std()              
- tBodyGyroJerkMag-mean()         
- tBodyGyroJerkMag-std()         
- fBodyAcc-mean()-X               
- fBodyAcc-mean()-Y               
- fBodyAcc-mean()-Z               
- fBodyAcc-std()-X               
- fBodyAcc-std()-Y                
- fBodyAcc-std()-Z                
- fBodyAcc-meanFreq()-X           
- fBodyAcc-meanFreq()-Y          
- fBodyAcc-meanFreq()-Z           
- fBodyAccJerk-mean()-X           
- fBodyAccJerk-mean()-Y           
- fBodyAccJerk-mean()-Z          
- fBodyAccJerk-std()-X            
- fBodyAccJerk-std()-Y            
- fBodyAccJerk-std()-Z            
- fBodyAccJerk-meanFreq()-X      
- fBodyAccJerk-meanFreq()-Y       
- fBodyAccJerk-meanFreq()-Z       
- fBodyGyro-mean()-X              
- fBodyGyro-mean()-Y             
- fBodyGyro-mean()-Z              
- fBodyGyro-std()-X               
- fBodyGyro-std()-Y               
- fBodyGyro-std()-Z              
- fBodyGyro-meanFreq()-X          
- fBodyGyro-meanFreq()-Y          
- fBodyGyro-meanFreq()-Z          
- fBodyAccMag-mean()             
- fBodyAccMag-std()               
- fBodyAccMag-meanFreq()          
- fBodyBodyAccJerkMag-mean()      
- fBodyBodyAccJerkMag-std()      
- fBodyBodyAccJerkMag-meanFreq()  
- fBodyBodyGyroMag-mean()         
- fBodyBodyGyroMag-std()          
- fBodyBodyGyroMag-meanFreq()    
- fBodyBodyGyroJerkMag-mean()     
- fBodyBodyGyroJerkMag-std()      
- fBodyBodyGyroJerkMag-meanFreq()

The variables for this data frame come from the accelerometer and gyroscope
3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals 
(prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth 
filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration 
signal was then separated into body and gravity acceleration signals 
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter 
with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in 
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also 
the magnitude of these three-dimensional signals were calculated using the 
Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
