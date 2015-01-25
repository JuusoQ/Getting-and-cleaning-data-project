
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
library(tidyr)

# Load tables into workspace
X_train <- read.table('UCI HAR Dataset/train/X_train.txt')
X_test <- read.table('UCI HAR Dataset/test/X_test.txt')
Y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
Y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')
features <- read.table('UCI HAR Dataset/features.txt', header=FALSE)
activities <- read.table('UCI HAR Dataset/activity_labels.txt', header=FALSE)
colnames(activities) <- c("activityID","activity")

X_data <- rbind(X_train, X_test)
Y_data <- rbind(Y_train, Y_test)
subject_data <- rbind(subject_train, subject_test)
colnames(subject_data) <- "subject"
colnames(X_data) <- features[,2]
colnames(Y_data) <- "activity"

#Add activity labels for Y_data 
Y_data <- merge(activities, Y_data, by.x="activityID", by.y="activity")

#combine X, Y and subject data into one data frame
dat <- cbind (Y_data, subject_data,X_data)

# 2. Extracts only the measurements on the mean and standard deviation
# Let's do some magic with the dplyr library here

means <- grep("mean()", colnames(dat))
stds  <- grep("std()", colnames(dat))

#Select columns containing means, standard deviations etc
data_measures_only <- dat[,c(1,2,3,means,stds)]


# Create tidy dataset

tidy <- data_measures_only %>% group_by(activity, subject) %>% summarise_each(funs(mean))

write.table(tidy, file = "result.txt", row.names = FALSE)

