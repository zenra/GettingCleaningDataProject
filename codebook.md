# Codebook

This project summarises the dataset from the Human Activity Recognition Using Smartphones study `[1`] `(the Study`). This code book describes the methodology used for the summarisation and the output variables.

## Raw Dataset

The Study's experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING`_UPSTAIRS, WALKING`_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments were video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. Finally a Fast Fourier Transform (FFT) was applied to some of these signals.

## Methodology

From the raw dataset, the training and test data have been combined. Observations are ordered by Subject then Activity.

Only the mean value and standard deviation of the measurements taken in the Study have been extracted. Each of these is averaged against each subject and activity pair. 

## Summary Dataset

* **Subject**: the id of each human subject in the Study
* **Activity**: the activity associated with the observation. It is always one of these: WALKING, WALKING`_UPSTAIRS, WALKING`_DOWNSTAIRS, SITTING, STANDING, LAYING
* All the variables below are averages of the original measurements. Prefix 't' denotes time domain signals, 'f' frequency domain signals. Phrase 'mean' denotes an original mean value, 'std' an original standard deviation. '.XYZ' denotes 3-axial signals in X, Y and Z directions.
   * **tBodyAcc.mean.X**
   * **tBodyAcc.mean.Y**
   * **tBodyAcc.mean.Z**
   * **tGravityAcc.mean.X**
   * **tGravityAcc.mean.Y**
   * **tGravityAcc.mean.Z**
   * **tBodyAccJerk.mean.X**
   * **tBodyAccJerk.mean.Y**
   * **tBodyAccJerk.mean.Z**
   * **tBodyGyro.mean.X**
   * **tBodyGyro.mean.Y**
   * **tBodyGyro.mean.Z**
   * **tBodyGyroJerk.mean.X**
   * **tBodyGyroJerk.mean.Y**
   * **tBodyGyroJerk.mean.Z**
   * **tBodyAccMag.mean**
   * **tGravityAccMag.mean**
   * **tBodyAccJerkMag.mean**
   * **tBodyGyroMag.mean**
   * **tBodyGyroJerkMag.mean**
   * **fBodyAcc.mean.X**
   * **fBodyAcc.mean.Y**
   * **fBodyAcc.mean.Z**
   * **fBodyAcc.meanFreq.X**
   * **fBodyAcc.meanFreq.Y**
   * **fBodyAcc.meanFreq.Z**
   * **fBodyAccJerk.mean.X**
   * **fBodyAccJerk.mean.Y**
   * **fBodyAccJerk.mean.Z**
   * **fBodyAccJerk.meanFreq.X**
   * **fBodyAccJerk.meanFreq.Y**
   * **fBodyAccJerk.meanFreq.Z**
   * **fBodyGyro.mean.X**
   * **fBodyGyro.mean.Y**
   * **fBodyGyro.mean.Z**
   * **fBodyGyro.meanFreq.X**
   * **fBodyGyro.meanFreq.Y**
   * **fBodyGyro.meanFreq.Z**
   * **fBodyAccMag.mean**
   * **fBodyAccMag.meanFreq**
   * **fBodyBodyAccJerkMag.mean**
   * **fBodyBodyAccJerkMag.meanFreq**
   * **fBodyBodyGyroMag.mean**
   * **fBodyBodyGyroMag.meanFreq**
   * **fBodyBodyGyroJerkMag.mean**
   * **fBodyBodyGyroJerkMag.meanFreq**
   * **angle(tBodyAccMean,gravity)**
   * **angle(tBodyAccJerkMean),gravityMean)**
   * **angle(tBodyGyroMean,gravityMean)**
   * **angle(tBodyGyroJerkMean,gravityMean)**
   * **angle(X,gravityMean)**
   * **angle(Y,gravityMean)**
   * **angle(Z,gravityMean)**
   * **tBodyAcc.std.X**
   * **tBodyAcc.std.Y**
   * **tBodyAcc.std.Z**
   * **tGravityAcc.std.X**
   * **tGravityAcc.std.Y**
   * **tGravityAcc.std.Z**
   * **tBodyAccJerk.std.X**
   * **tBodyAccJerk.std.Y**
   * **tBodyAccJerk.std.Z**
   * **tBodyGyro.std.X**
   * **tBodyGyro.std.Y**
   * **tBodyGyro.std.Z**
   * **tBodyGyroJerk.std.X**
   * **tBodyGyroJerk.std.Y**
   * **tBodyGyroJerk.std.Z**
   * **tBodyAccMag.std**
   * **tGravityAccMag.std**
   * **tBodyAccJerkMag.std**
   * **tBodyGyroMag.std**
   * **tBodyGyroJerkMag.std**
   * **fBodyAcc.std.X**
   * **fBodyAcc.std.Y**
   * **fBodyAcc.std.Z**
   * **fBodyAccJerk.std.X**
   * **fBodyAccJerk.std.Y**
   * **fBodyAccJerk.std.Z**
   * **fBodyGyro.std.X**
   * **fBodyGyro.std.Y**
   * **fBodyGyro.std.Z**
   * **fBodyAccMag.std**
   * **fBodyBodyAccJerkMag.std**
   * **fBodyBodyGyroMag.std**
   * **fBodyBodyGyroJerkMag.std**


## Reference

1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
