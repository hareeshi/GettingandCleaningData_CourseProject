library(reshape2)

#################### Task 1: Merge and the train and test data########

#Read the raw train data and append the activity id and subject id 
train_raw_data <- read.table("./train/X_train.txt")
train_activity <- read.table("./train/y_train.txt")
train_subject <- read.table("./train/subject_train.txt")
train_data <- cbind(train_activity,train_subject,train_raw_data)

#Read the raw test data and append the activity id and subject id 
test_raw_data <- read.table("./test/X_test.txt")
test_activity <- read.table("./test/y_test.txt")
test_subject <- read.table("./test/subject_test.txt")
test_data <- cbind(test_activity,test_subject,test_raw_data)

# Combine the train and test data
total_data <-rbind(train_data,test_data)

###################### Task 1 End #################################


############ Task 4: Label the data with descriptive variable name####

# Read the official labels from the features.txt 
labels <- read.table("./features.txt")

# Create a dummy data frame for the activity id and subject id
addnl_labels <- data.frame(V1=c(-1,-2),V2= c("Activity_Id","Subject_Id"))

# Assign the combined label names to the data
f_labels <- rbind(addnl_labels,labels)
colnames(total_data) <- f_labels$V2
###################### Task 4 End #################################


##### Task 3: Use descriptive activity names to describe the activities in the database###

#Read from the activity labels file
activity_names <- read.table("./activity_labels.txt")
colnames(activity_names) <- c("Activity_Id","Activity_Name")

#Merge the activity file with the master data
merged_data <- merge (activity_names,total_data)

###################### Task 3 End #################################


######## Task 2: Extracts only measurements of the mean and standard deviation for each measurement

# Identify mean and sd related columns using regex on column names
data_mean_sd <- grep("([Mm]ean|[Ss][Tt][Dd])[()]", names(merged_data))

#preserve the first 2 columns - activity id and subject id
data_mean_sd <- c(c(2,3),data_mean_sd)

# Subset the data with only relevant columns
filtered_data <- merged_data[,data_mean_sd]

###################### Task 2 End #################################

######## Task 5: Create an independent data set with average of each activity and subject####

#Get the average of each variable per activity and subject
aggregated_data <- aggregate (filtered_data[,3:74], by = list(Subject_Id=filtered_data$Subject_Id,Activity_Name=filtered_data$Activity_Name),FUN=mean)

#Write the values into a new text file
write.table(aggregated_data,"./tidydata.txt",row.names = FALSE)

###################### Task 5 End #################################
