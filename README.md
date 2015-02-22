##Coursera: Getting and Cleaning Data Course Project
The CodeBook.md file contains the procedure by which the run_analysis.R script creates the msObsvData and msObsvDataMeans data frames required for this project. 

The msObsvData data frame consists of the merged training and test data sets from the getdata_projecfiles_UCIHARDataset.zip file. 

The msObsvDataMeans data frame is the filtered msObsvData data frame and contains only the columns with 'mean' or 'std' as part of the column name. These columns are then grouped by activityDesc and subjectNum columns and means are calculated for each grouping.

### Requirements for script execution.
The 'plyr' package is required for this script. Additionally, this script must be executed with the following files and folder hierarchy.
- /project (folder)
  - run_analysis.R (this script)
  - features.txt (list of features/column names)
  - activity_labels.txt (ID numbers and descriptive names for each activity recorded)
  - /train (folder)
    - subject_train.txt (subject ID for each observation. Range is 1:30)
    - X_train.txt (observations for each feature/column listed in features.txt)
    - y_train.txt (activity ID for each observation. Range is 1:6)
  - /test (folder)
    - subject_test.txt (subject ID for each observation. Range is 1:30)
    - X_test.txt (observations for each feature/column listed in features.txt)
    - y_test.txt (activity ID for each observation. Range is 1:6)
