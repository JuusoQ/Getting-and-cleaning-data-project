---
title: "CodeBook"
output: html_document
---

Data dictionary for Getting and cleaning data -course dataset
===============================================================

First part of this document contains data dictionary for the Getting and cleaning data -course and second part describes how run_analysis.R -script process the data 

### Input

Input files from UCI HAR Dataset that are included to this analysis:

- y_train.txt
- X_train.txt
- y_test.txt
- Y_train.txt
- subject_train.txt
- subject_test.txt
- features.txt
- activity_labels.txt

Original data source created from these files contains 564 variables, including activity, activity type, subject and measurements from different sensors. Measurements are explained in README.txt -file in the full dataset. Features are explained in the features_info.txt -file.

Explanation about transformations is in the README -file.

## Variables in merged dataset 

1. activityID - Id number for certain activity, data type: integer 
2. activity - Label for certain activity, data type: factor (string)
3. Subject - subject, data type: factor (integer), range 1 - 30

Following 561 variables include measurements from the sensors. Data type: double.

## Variables in transformed dataset

1. activityID, Id number for certain activity, data type: integer
2. activity, Label for certain activity, data type: factor (string)
3. subject, subject, data type: factor (integer), range 1 - 30

Following variables contains mean and standard deviation of the measurements.





