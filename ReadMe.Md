README
======

##  Getting and cleaning data -course

This file contains information what run_analysis.R script does:

### Given task

 You should create one R script called run_analysis.R that does the following. 
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
### Description of the run_analysi.R script

1. Read files into workspace using read.table -functions
2. Set more descriptive column names
3. Bind training and test data into one and merge different variables
4. Select columns containing terms "mean" and "std"
5. Create new dataset containing only variables selected in step 4
6. By using dplyr::group_by and dplyr::summarise_each functions, calculate mean of these variables and create tidy dataset
7. write dataset created in step 6 into txt file





