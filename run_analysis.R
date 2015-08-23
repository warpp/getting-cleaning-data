if (!require("data.table")) {
    install.packages("data.table")
}

if (!require("reshape2")) {
    install.packages("reshape2")
}

require("data.table")
require("reshape2")

#load test files
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

#load train files
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

#load activity labels and data column names
features <- read.table("./UCI HAR Dataset/features.txt")
aclabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

#rename columns
y_test[,2] = aclabels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
colnames(subject_test) <- "subject_id"
y_train[,2] = aclabels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
colnames(subject_train) <- "subject_id"

#name columns in test and train data 
labelNames <- as.vector(features$V2)
colnames(x_test)  <- labelNames
colnames(x_train)  <- labelNames

#combine test data into one data frame
test <- cbind(subject_test, x_test, y_test)

#combine train data into one data frame
train <- cbind(subject_train, x_train, y_train)

#extract only the measurements on the mean and standard deviation for each measurement
extract_meanstd <- grepl(".*Mean.*|.*Std.*", labelNames, ignore.case=TRUE)
test = test[,extract_meanstd]
train = train[,extract_meanstd]

#merge test and train data
data <- rbind(train, test)

#remove duplicates in variable name
names(data)<-gsub("BodyBody", "Body", names(data))

#reshape data by subject and activity
id_labels = c("subject_id", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data = melt(data, id = id_labels, measure.vars = data_labels)

#apply mean function to dataset using dcast function
tidy_data = dcast(melt_data, subject_id + Activity_Label ~ variable, mean)

#write tidy data to file
write.table(tidy_data, file = "./tidy_data.txt",row.names=FALSE)
