# Getting and Cleaning Data Project

## run_analysis.R

The cleanup script (run_analysis.R) does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Running the script

To run the script, source `run_analysis.R`.


## Process


1. Checks if the dataset zip file exists, otherwise it downloads;
2. Checks if the file has already been extracted to the directory; If not, it extracts (unzip)
3. Load both test and train data;
4. Load the features and activity labels;
5. Extract the mean and standard deviation column names and data by grepping for the mean() and std() in the names
6. Process the data;
7. Merge and creates data set using rbind and cbind 
8. The result is saved as "./tidysetavgfile", in both csv and txt format, a 180x69 data table, where the second column contains subject IDs, the third column contains activity names, and subsequent columns have the averages for each of the 66 attributes. 
There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.

## Cleaned Data

The resulting clean dataset is in: `data/cleanoutputfile.txt`. It contains one row for each subject/activity pair and columns for subject, activity, and each feature that was a mean or standard deviation from the original dataset.
