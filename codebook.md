## Codebook for the Tidy Dataset

**Introduction**

This dataset stems from the *Human Activity Recognition Using Smatphones Dataset* study from the University of California, Irvine. Information about this study, as well as the original data sets, can be found in the [UCI study page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

In this study, 30 individuals between the ages of 19 and 48 years performed 6 activities (walk, walk upstairs, walk downstairs, lay, sit, and stand) with a smatphone in their waist. Data with 561 features was collected from the gyroscope and accelerometer of the phone for each activity.

For more information about the raw data, please check the `README.txt` file from the [original dataset](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/).

###The tidy dataset

Readings are related to the time and frequency domains, which are represented by the prefixes
```
Time
Freq
```

The dataset contains normalized data on the readings from the phone's accelerometer and gyroscope in the X, Y, and Z axis. This is labeled as:
```
Accel
Gyro
```



For the purpose of this assignment, we have selected only the variables containing values for *mean* and *standard deviation*. These are labeled in the dataset as:
```
StdDev
Mean
```
asdasd
```
Subject
Activity                              
TimeBodyAccelMean()X
TimeBodyAccelMean()Y
TimeBodyAccelMean()Z
TimeBodyAccelStdDev()X
TimeBodyAccelStdDev()Y
TimeBodyAccelStdDev()Z
TimeGravityAccelMean()X
TimeGravityAccelMean()Y
TimeGravityAccelMean()Z
TimeGravityAccelStdDev()X
TimeGravityAccelStdDev()Y
TimeGravityAccelStdDev()Z
TimeBodyAccelJerkMean()X
TimeBodyAccelJerkMean()Y
TimeBodyAccelJerkMean()Z
TimeBodyAccelJerkStdDev()X
TimeBodyAccelJerkStdDev()Y
TimeBodyAccelJerkStdDev()Z
TimeBodyGyroMean()X
TimeBodyGyroMean()Y
TimeBodyGyroMean()Z
TimeBodyGyroStdDev()X
TimeBodyGyroStdDev()Y
TimeBodyGyroStdDev()Z
TimeBodyGyroJerkMean()X
TimeBodyGyroJerkMean()Y
TimeBodyGyroJerkMean()Z
TimeBodyGyroJerkStdDev()X
TimeBodyGyroJerkStdDev()Y
TimeBodyGyroJerkStdDev()Z
TimeBodyAccelMagnitudeMean()
TimeBodyAccelMagnitudeStdDev()
TimeGravityAccelMagnitudeMean()
TimeGravityAccelMagnitudeStdDev()
TimeBodyAccelJerkMagnitudeMean()
TimeBodyAccelJerkMagnitudeStdDev()
TimeBodyGyroMagnitudeMean()
TimeBodyGyroMagnitudeStdDev(
TimeBodyGyroJerkMagnitudeMean()
TimeBodyGyroJerkMagnitudeStdDev()
FreqBodyAccelMean()X
FreqBodyAccelMean()Y
FreqBodyAccelMean()Z
FreqBodyAccelStdDev()X
FreqBodyAccelStdDev()Y
FreqBodyAccelStdDev()Z
FreqBodyAccelJerkMean()X
FreqBodyAccelJerkMean()Y
FreqBodyAccelJerkMean()Z
FreqBodyAccelJerkStdDev()X
FreqBodyAccelJerkStdDev()Y
FreqBodyAccelJerkStdDev()Z
FreqBodyGyroMean()X
FreqBodyGyroMean()Y
FreqBodyGyroMean()Z
FreqBodyGyroStdDev()X
FreqBodyGyroStdDev()Y
FreqBodyGyroStdDev()Z
FreqBodyAccelMagnitudeMean()
FreqBodyAccelMagnitudeStdDev()
FreqBodyBodyAccelJerkMagnitudeMean()
FreqBodyBodyAccelJerkMagnitudeStdDev()
FreqBodyBodyGyroMagnitudeMean()
FreqBodyBodyGyroMagnitudeStdDev()
FreqBodyBodyGyroJerkMagnitudeMean()
FreqBodyBodyGyroJerkMagnitudeStdDev()
```
dsfsdfs
