# read activity_labels.txt file and rename columns to descriptive names
activityLabels <- read.table("activity_labels.txt")
names(activityLabels)[names(activityLabels)=="V1"] <- "activityNum"
names(activityLabels)[names(activityLabels)=="V2"] <- "activityDesc"

# read features.txt file and rename columns to descriptive names
features <- read.table("features.txt")
names(features)[names(features)=="V1"] <- "featureIndex"
names(features)[names(features)=="V2"] <- "featureName"

# read ./train/subject_train.txt and ./test/subject_test.txt file
subjectTrn <- read.table("./train/subject_train.txt")
subjectTst <- read.table("./test/subject_test.txt")

# append subjectTst to subjectTrn
subjectData <- rbind(subjectTrn,subjectTst)

#rename subjectData columns to descriptive names
names(subjectData)[names(subjectData)=="V1"] <- "subjectNum"

# read ./train/y_train.txt and ./test/y_test.txt file
activityTrn <- read.table("./train/y_train.txt")
activityTst <- read.table("./test/y_test.txt")

# append activityTst to activityTrn 
activityData <- rbind(activityTrn, activityTst)

# rename activityData columns to descriptive names
names(activityData)[names(activityData)=="V1"] <- "activityNum"

# read ./train/x_train.txt and ./test/X_test.txt
obsvTrn <- read.table("./train/x_train.txt")
obsvTst <- read.table("./test/X_test.txt")

# append obsvTst to obsvTrn
obsvData <- rbind(obsvTrn,obsvTst)

# rename columns in obsvData to correspond to featureName variables in features table
names(obsvData) <- features$featureName

# get column indices from obsvData that have 'mean' or 'std' in column name
meanStdCols <- grep("mean|std",names(obsvData))

#get columns from obsvData that are mean or std deviation measurements
msObsvData <- obsvData[,meanStdCols]

# bind activityTrn, subjectTrn, and msObsvTrn into one dataframe
msObsvData <- cbind(subjectData,activityData,msObsvData)

# merge activityLabels and trnData1 dataframes to get activityDesc column values
msObsvData <- merge(activityLabels,msObsvData, by="activityNum")

# drop activityNum column.
msObsvData <- msObsvData[,2:82]

# group by activityDesc and subjectNum. Then calculate means for each group
msObsvDataMeans <- ddply(msObsvData,c("activityDesc","subjectNum"),function(msObsvData) colMeans(msObsvData[,3:81]))

