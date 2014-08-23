run_analysis.R
====================================

Overview:

The script reads the Samsung data files in the working directory and performs the below functions.
Task 1: Merges the training and the test sets to create one data set.
Task 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
Task 3: Uses descriptive activity names to name the activities in the data set
Task 4: Appropriately labels the data set with descriptive variable names. 
Task 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Prerequisites:
1. Download and unzip the samsung data file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. The run_analysis.R should be placed under <unzip dir>/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset 
3. The directory where the script is placed should be set as the working directory.
4. In other words, the script directory will have test and train folder in the same directory

Script Logic:
In this scripts the tasks above are accomplished in the below order

1. Task 1: Merges the train and test data. This step includes reading the test and train data, appending the activity id and subject id and combinding the data sets

2. Task 4: Labels the data with descriptive variable name. The script performs labelling the data at this stage from the features.txt file. Activity id and Subject id are labelled manually. This change in order (compared to the one given in the project enables easy manipulation of data at a later stage. I have left most of the feature names as given in the features.txt, in order to keep it aligned with the published data set and description. Any manipulation of the names will make it more difficult to reconcile with the raw data.
   
3.Task 3: Uses descriptive activity names to describe the activities in the database. Merge the data with names from activity_labels.txt to replace the ids with meaningful activity names

4.Task 2: Extracts only measurements of the mean and standard deviation for each measurement. The script subsets the data to keep only the mean and sd related columns

5.Task 5: Create an independent data set with average of each activity and subject. The final step is to group the data with subject id and activity name with average of all other measures. The script uses aggregate functions to do that. The tidy data is then written into a local file.
   
