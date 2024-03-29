### Original data

The original data can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Manipulation

Fristly, the two groups which compose the original data are combined
into a single dataset.

Secondly, activity names are specified in plain-english (e.g. 'STANDING').

Thirdly, only the mean and standard deviation are considered.

Lastly, all observations for each distinct combination of subject and
activity are meaned.

This provides 180 rows of data: 30 subjects each having carried out 6
distinct activities.

### For each record in the resulting data frame

* subject: An identifyier of the subject who carried out the experiment.
* activity: A plain-english description of the activity being carried out.
* The mean and standard deviation for all distinct features of the
  original dataset. From the original dataset:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

See the original data for more information.

