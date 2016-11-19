## Codebook for the Tidy Dataset

**Introduction**

This dataset stems from the *Human Activity Recognition Using Smatphones Dataset* study from the University of California, Irvine. Information about this study, as well as the original data sets, can be found in the [UCI study page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

In this study, 30 individuals between the ages of 19 and 48 years performed 6 activities (walk, walk upstairs, walk downstairs, lay, sit, and stand) with a smatphone in their waist. Data with 561 features was collected from the gyroscope and accelerometer of the phone for each activity.

For more information about the raw data, please check the `README.txt` file from the [original dataset](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/).

###The tidy dataset

The original dataset contains normalized data on the readings from the phone's accelerometer and gyroscope in the X, Y, and Z axis. This is labeled as:
```
Accel
Gyro
```
Readings are related to the time and frequency domains, which are represented by the prefixes
```
Time
Freq
```


For the purpose of this assignment, we have selected only the variables containing values for *mean* and *standard deviation*. These are labeled in the dataset as:
```
StdDev
Mean
```
asdasd

