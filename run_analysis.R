#set working directory
setwd("C:/Users/ngboonpin/Documents/UCI HAR")

#Read headers for data set
feature_names = read.table('features.txt')
head(feature_names)

#read data,activities and subject for test and train

#test data
test_dat <- read.table('UCI HAR Dataset/test/x_test.txt')
head(test_dat)
dim(test_dat)

test_act <- read.table('UCI HAR Dataset/test/y_test.txt')
head(test_act)
dim(test_act)
colnames(test_act) <- c("Activity")

test_sub <- read.table('UCI HAR Dataset/test/subject_test.txt')
head(test_sub)
dim(test_sub)
colnames(test_sub) <- c("Subject")

#train data
train_dat <- read.table('UCI HAR Dataset/train/X_train.txt')
head(train_dat)
dim(train_dat)

train_act <- read.table('UCI HAR Dataset/train/Y_train.txt')
head(train_act)
dim(train_act)
colnames(train_act) <- c("Activity")

train_sub <- read.table('UCI HAR Dataset/train/subject_train.txt')
head(train_sub)
dim(train_sub)
colnames(train_sub) <- c("Subject")

#set header for test and train data set
names(test_dat) <- feature_names$V2
names(train_dat) <- feature_names$V2

#merge subject to train and test data set
train_dat <- cbind(train_dat,train_sub)
test_dat <- cbind(test_dat,test_sub)


#merge activity to train and test data set
train_dat <- cbind(train_dat,train_act)
test_dat <- cbind(test_dat,test_act)


#combine train and test data set
combine_dat <- rbind(test_dat,train_dat)

#prepare to select mean and std column

selected_column <- grepl( '(-mean\\(\\)|-std\\(\\))', feature_names$V2 )
selected_column <- append(selected_column,TRUE)
selected_column <- append(selected_column,TRUE)

#get mean and std column
stage_data1 <- combine_dat[,selected_column]

#activities names
activity_labels <- read.table('activity_labels.txt')
colnames(activity_labels) <- c("Activity","Activity_Name")

stage_data2 <- merge(stage_data1,activity_labels,by.x="Activity",by.y="Activity")

#remove column activity that was used for merging data
stage_data2$Activity <- NULL

#Rename column
names(stage_data2)<-gsub("^t", "time", names(stage_data2))
names(stage_data2)<-gsub("^f", "frequency", names(stage_data2))
names(stage_data2)<-gsub("Acc", "Accelerometer", names(stage_data2))
names(stage_data2)<-gsub("Gyro", "Gyroscope", names(stage_data2))
names(stage_data2)<-gsub("Mag", "Magnitude", names(stage_data2))
names(stage_data2)<-gsub("BodyBody", "Body", names(stage_data2))

#Get tidy data
tidy_data <- aggregate(. ~ Subject + Activity_Name, stage_data2, mean )
write.table(tidy_data, file = "tidydata.txt",row.name=FALSE)


