
# url

	fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# zipfile

	zipfile <- "./getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# directory

	dirfile <- "./UCI HAR Dataset"
# Download the file if it doesnt exist
	if(file.exists(zipfile) ==FALSE) {
		download.file(fileUrl, destfile = zipfile)
	}
#Unzip the file
	if(file.exists(dirfile) == FALSE){
	unzip(zipfile)
	}
# Merge the train and test data sets
	x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
	x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
	y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
	y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
	s_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
	s_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

	x <- rbind(x_train, x_test)
	y <- rbind(y_train, y_test)
	s <- rbind(s_train, s_test)

	data <- cbind(x,y,s)
	
#Read and name features column

	features <- read.table("./UCI HAR Dataset/features.txt")
	names(features) <- c('f_id', 'f_name')
	

# Search for mean() and std() in the features set

	meanstd <- grep(".*mean\\(\\).*|.*std\\(\\).*", features$f_name)
	x <- x[,meanstd]

#Create a tidy dataset with the mean and std data
		
	names(x) <- gsub("\\(|\\)", "", (features[meanstd, 2]))

#Use descriptive activity names to name the activities of the data set
#Read and assign names to ativities from the activity file

	activities <- read.table ("./UCI HAR Dataset/activity_labels.txt")
	names(activities) <- c('a_id', 'a_name')
	y[,1] = activities[y[, 1], 2]

	names(y) <- "Activity"
	names(s) <- "Subject"

#Create a clean dataset from the above

	cleandata <- cbind(s,y,x)
	
	#print (head (cleandata,7))

#Create a tidydataset with the average of each variable in the above clean dataset

	tidyset <- cleandata[, 3:dim(cleandata)[2]]
	tidysetavg <- aggregate(tidyset,list(cleandata$Subject, cleandata$Activity), mean)

#Assign columns names to the tidyset
	
	names(tidysetavg)[1] <- "Subject"
	names(tidysetavg)[2] <- "Activity"

#Create and write all tables to disk

	cleandatafile <- "./cleanoutputfile.txt"
	write.table(cleandata, cleandatafile)
	tidysetavgfile <- "./tidysetavgfile.csv"
	write.csv(tidysetavg, tidysetavgfile)
	tidysetavgtxt <- "./tidysetavgtxt.txt"
	write.table(tidysetavg, tidysetavgtxt, row.names = FALSE)


	





		



	


		
	