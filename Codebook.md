# Code Book for the Course Project
This describes the source data, and  transformations or work to clean up the data and conduct analysis.

## Source of dataset
Dataset download at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## List of steps to clean the data and conduct analysis
1.  Download the dataset.
2.  Unzip the dataset into the working directory.
3.  Load the training (Xtrain, Ytrain & Subjecttrain) and test (Xtrain, Ytrain & Subjecttrain) datasets into data frames.
4.  Merge both datasets into Xmerge, Ymerge and Subjectmerge using rbind.
5.  Load the variable names (features).
6.  Extract the required measurement which are mean and standard deviation.
7.  Load the activity labels.
8.  Relabel variables from Xmerge, Ymerge and Subjectmerge into X, Y and Subject respectively.
9.  Relabel Y from "activityID" into activity labels.
10. Create 1st table called "merged_tidy_data.txt" with the combined data frame using write.table.
11. Create another dataset using data.table.
12. Calculate the mean and standard deviation for each activity and subject.
13. Create 2nd table called "calculated_tidy_data.txt" for data in step 12.
