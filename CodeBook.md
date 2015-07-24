# Code Book for Course Project - Getting & Cleaning Data

This CodeBook that describes the variables, the data, and any transformations or work that was performed to clean up the source data to create a tidy dataset as per requirements of course project.

##Data Set Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.

##The dataset includes the following files:
* 'features_info.txt': Shows information about the variables
* 'features.txt': List of all features
* 'activity_labels.txt': Links the class labels with their activity name
* 'train/X_train.txt': Training set
* 'train/y_train.txt': Training labels
* 'test/X_test.txt': Test set
* 'test/y_test.txt': Test labels
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

##Work/Transformation
* read variable names, variables(data), activities, subject and store them at their respective data frame
* Set variable names to test and train data frame
* Add column subject and activity to test and train data frame using cbind
* combine test and train data frame using rbind
* select only mean and std variable for further processing by using grepl function and subsetting
* applying merge function to bring activity name to data frame preprared at previous step
* remove column Activity (code)
* rename column to have more meaningful name using gsub
  * t -> time
  * f -> frequency
  * Acc -> Accelerometer
  * Gyro -> Gyroscope
  * Mag -> Magnitude
  * BodyBody -> Body
* prepare tidy data frame by apply aggregate function, basically it averages all std and mean variables and group by Subject, Activity_Name
* last step is to output tidy data to text file 

##Variables

Subject
- 1 or 2 characters
    * Subject ID from 1 - 30 

Activity_Name					
- between 8 to 18 characters
    - 1 WALKING 
    - 2 WALKING_UPSTAIRS 
    - 3 WALKING_DOWNSTAIRS
    - 4 SITTING
    - 5 STANDING
    - 6 LAYING 

**Following Variables are numeric and bounded within [-1,1]:-**

1 timeBodyAccelerometer-mean()-X			
2 timeBodyAccelerometer-mean()-Y
3 timeBodyAccelerometer-mean()-Z
4 timeBodyAccelerometer-std()-X
5 timeBodyAccelerometer-std()-Y
6 timeBodyAccelerometer-std()-Z
7 timeGravityAccelerometer-mean()-X
8 timeGravityAccelerometer-mean()-Y
9 timeGravityAccelerometer-mean()-Z
10 timeGravityAccelerometer-std()-X
11 timeGravityAccelerometer-std()-Y
12 timeGravityAccelerometer-std()-Z
13 timeBodyAccelerometerJerk-mean()-X
14 timeBodyAccelerometerJerk-mean()-Y
15 timeBodyAccelerometerJerk-mean()-Z
16 timeBodyAccelerometerJerk-std()-X
17 timeBodyAccelerometerJerk-std()-Y
18 timeBodyAccelerometerJerk-std()-Z
19 timeBodyGyroscope-mean()-X
20 timeBodyGyroscope-mean()-Y
21 timeBodyGyroscope-mean()-Z
22 timeBodyGyroscope-std()-X
23 timeBodyGyroscope-std()-Y
24 timeBodyGyroscope-std()-Z
25 timeBodyGyroscopeJerk-mean()-X
26 timeBodyGyroscopeJerk-mean()-Y
27 timeBodyGyroscopeJerk-mean()-Z
28 timeBodyGyroscopeJerk-std()-X
29 timeBodyGyroscopeJerk-std()-Y
30 timeBodyGyroscopeJerk-std()-Z
31 timeBodyAccelerometerMagnitude-mean()
32 timeBodyAccelerometerMagnitude-std()
33 timeGravityAccelerometerMagnitude-mean()
34 timeGravityAccelerometerMagnitude-std()
35 timeBodyAccelerometerJerkMagnitude-mean()
36 timeBodyAccelerometerJerkMagnitude-std()
37 timeBodyGyroscopeMagnitude-mean()
38 timeBodyGyroscopeMagnitude-std()
39 timeBodyGyroscopeJerkMagnitude-mean()
40 timeBodyGyroscopeJerkMagnitude-std()
41 frequencyBodyAccelerometer-mean()-X
42 frequencyBodyAccelerometer-mean()-Y
43 frequencyBodyAccelerometer-mean()-Z
44 frequencyBodyAccelerometer-std()-X
45 frequencyBodyAccelerometer-std()-Y
46 frequencyBodyAccelerometer-std()-Z
47 frequencyBodyAccelerometerJerk-mean()-X
48 frequencyBodyAccelerometerJerk-mean()-Y
49 frequencyBodyAccelerometerJerk-mean()-Z
50 frequencyBodyAccelerometerJerk-std()-X
51 frequencyBodyAccelerometerJerk-std()-Y
52 frequencyBodyAccelerometerJerk-std()-Z
53 frequencyBodyGyroscope-mean()-X
54 frequencyBodyGyroscope-mean()-Y
frequencyBodyGyroscope-mean()-Z
frequencyBodyGyroscope-std()-X
frequencyBodyGyroscope-std()-Y
frequencyBodyGyroscope-std()-Z
frequencyBodyAccelerometerMagnitude-mean()
frequencyBodyAccelerometerMagnitude-std()
frequencyBodyAccelerometerJerkMagnitude-mean()
frequencyBodyAccelerometerJerkMagnitude-std()
frequencyBodyGyroscopeMagnitude-mean()
frequencyBodyGyroscopeMagnitude-std()
frequencyBodyGyroscopeJerkMagnitude-mean()
frequencyBodyGyroscopeJerkMagnitude-std()

