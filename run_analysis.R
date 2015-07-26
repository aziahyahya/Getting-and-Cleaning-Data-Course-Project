# Step1. Merges the training and the test sets to create one data set.
# Load Training data
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
dim(Xtrain) 
head(Xtrain)
Ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
table(Ytrain)
Subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# Load Test data
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
dim(Xtest) 
Ytest <- read.table("./UCI HAR Dataset/test/y_test.txt") 
table(Ytest) 
Subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Merge data
Xmerge <- rbind(Xtrain, Xtest)
dim(Xmerge) 
Ymerge <- rbind(Ytrain, Ytest)
dim(Ymerge) 
Subjectmerge <- rbind(Subjecttrain, Subjecttest)
dim(Subjectmerge) 

# Step2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("UCI HAR Dataset/features.txt", col.names=c("featureId", "featureLabel"))
includedFeatures <- grep("-mean\\(\\)|std\\(\\)", features$featureLabel)

# Step3. Uses descriptive activity names to name the activities in the data set.
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activityId", "activityLabel"))
activities$activityLabel <- gsub("_", "", as.character(activities$activityLabel))

# Step4. Appropriately labels the data set with descriptive activity names. 
Subject <- Subjectmerge
names(Subject) <- "subjectId"
X <- Xmerge
X <- X[, includedFeatures]
names(X) <- gsub("\\(|\\)", "", features$featureLabel[includedFeatures])
Y <- Ymerge
names(Y) = "activityId"
activity <- merge(Y, activities, by="activityId")$activityLabel
dataset <- cbind(Subject, X, activity)
write.table(dataset, "merged_tidy_data.txt")

# Step5. Creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject. 
library(data.table)
dataDT <- data.table(dataset)
calculatedData<- dataDT[, lapply(.SD, mean), by=c("subjectId", "activity")]
write.table(calculatedData, "calculated_tidy_data.txt")


