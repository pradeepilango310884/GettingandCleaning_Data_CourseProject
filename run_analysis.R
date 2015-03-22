library(plyr)


# 1: Merge the training and test sets to create one data set


x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# create 'x' data set
x_dataset <- rbind(x_train, x_test)

# create 'y' data set
y_dataset <- rbind(y_train, y_test)

# create 'subject' data set
subject_dataset <- rbind(subject_train, subject_test)


# 2: Extract only the measurements on the mean and standard deviation for each measurement


features <- read.table("features.txt")

# Get the columns having mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# sub-setting  the required columns
x_dataset <- x_dataset[, mean_and_std_features]

# correct the column names 
names(x_dataset) <- features[mean_and_std_features, 2]


# 3: Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_dataset[, 1] <- activities[y_dataset[, 1], 2]

# correct column name
names(y_dataset) <- "activity"


# 4: Appropriately label the data set with descriptive variable names

# correct column name
names(subject_dataset) <- "subject"

# Get all the data into single data set
all_data <- cbind(x_dataset, y_dataset, subject_dataset)


# 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Tidy_averages_dataset <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(Tidy_averages_dataset, "Tidy_averages_dataset.txt", row.name=FALSE)