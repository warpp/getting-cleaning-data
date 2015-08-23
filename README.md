README.md
========

--------

Project Description
------------------

The purpose of this project is to collect, work with and prepare a tidy data set that can be used for further analysis. The result is a script run_analysis.R which performs a series of steps in order to produce tidy data set from the original data.



Creating the tidy data
--------------------------------

###Collection of the raw data

Raw data are obtained from UCI Machine Learning repository. The data in this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone.A full description is available at the UCI Machine Learning repository: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Link for downloading the data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


###Important information before you start 
The R script assumes that you have downloaded the data set(zip file) and extracted it into your working directory, in a directory called "UCI HAR Dataset". The libraries used in the code are data.table and reshape2. If you don't have them installed, the script will install them.


###Cleaning the data

The script run_analysis.R does the following:
1. loads the files from original test and train data set, which contain data about subjects, activities and measurements.
2. labels columns in test and train data sets
3. combines test data into one data frame, and train data into one data frame
4. extracts only mean and standard deviation measurements from both test and train data
5. merges test and train data into one data set
6. reshapes the data by subject and activity with an average of each variable for each activity and each subject
7. creates tidy_data.txt file with tidy data.


###Variables in the tidy_data.txt file
Information about variables in the tidy_data.txt file are in the CodeBook in this repository.


####Notes:
The script creates the tidy data set in the working directory. 

