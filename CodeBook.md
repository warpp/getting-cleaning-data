Code Book
========

--------

Data Source
------------------

Raw data are obtained from UCI Machine Learning repository. The data in this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the UCI Machine Learning repository: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Link for downloading the data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Cleaning Data
-------------
Final result of run_analysis.R script is tidy_data.txt file, which contains cleaned, tidy data available for further analysis. The script does the following:
1. merges the training and the test sets to create one data set,
2. extracts only the measurements on the mean and standard deviation for each measurement,
3. uses descriptive activity names to name the activities in the data set,
4. labels the data set with descriptive variable names,
5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.

More about the process of cleaning data can be found in readme.md file in this repository.[link here]

Feature selection 
----------------------

The original data set contains readme, features_info.txt and features.txt files, which give a full description of features selected for the original dataset. 

From the data set authors' description: 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
Each record has following data:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.


Variables in tidy data set
--------------------------

Since the assignment states that we should extracts only the measurements on the mean and standard deviation for each measurement, in the tidy data set I included all variables which are related to mean or standard deviation. In this data set numeric variables are averaged for each activity and each subject.
The final, tidy data set contains 180 observations with 88 variables divided in:

*  an activity label: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
*  an identifier of the subject who carried out the experiment
*  a 86-feature vector with time and frequency domain signal variables (numeric)


For this derived dataset, these signals were used to estimate variables of the feature vector for each pattern:
('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions)

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated (and kept for this assignment) from these signals are:

* mean(): Mean value
* std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean


About variable names
-----------

The resulting variable names are mostly left as original features names, because I find they are descriptive enough to understand what measurement they relate to (especially in combination with features_info.txt file from the original data set), and I believe that renaming them using longer names would only reduce readability. The only renaming I did was transforming double item ("BodyBody") to single ("Body") in some names. 

