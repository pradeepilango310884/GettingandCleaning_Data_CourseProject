
## Variables Definition 
* x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.

* x_dataset, y_dataset and subject_dataset merges their respective datasets to further analysis.

* features contains the correct names for the x_dataset dataset, which are applied to the column names stored in mean_and_std_features,
   a numeric vector used to extract the desired data.

* A similar approach is taken with activity names through the activities variable.

* all_dataset merges x_dataset, y_dataset and subject_dataset in a big dataset.

* Finally, Tidy_averages_dataset contains the required averages which has to be stored in a .txt file. 

* Here ddply() from the plyr package is used to apply colMeans() and ease the development.


## Code Guide

1. Merges the training and the test sets to create one data set.  * This is done using rbind() on respective dataset/variables.

2. Extracts only the measurements on the mean and standard deviation for each measurement.  use read.table to gather and subset features and activities

3. Uses descriptive activity names to name the activities in the data set.

*  use read.table to gather and subset features and activities

4. Appropriately labels the data set with descriptive variable names. * use cbind to perfom the task.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject 

* Use ddply and write.table to get the target dataset and file created.
