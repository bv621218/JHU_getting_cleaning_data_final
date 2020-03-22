The data contained in **tidy\_data.txt** is produced using the
**run\_analysis.R** script. The data are summarized values of
measurements smartphone activity
[data](Davide%20Anguita,%20Alessandro%20Ghio,%20Luca%20Oneto,%20Xavier%20Parra%20and%20Jorge%20L.%20Reyes-Ortiz.%20A%20Public%20Domain%20Dataset%20for%20Human%20Activity%20Recognition%20Using%20Smartphones.%2021th%20European%20Symposium%20on%20Artificial%20Neural%20Networks,%20Computational%20Intelligence%20and%20Machine%20Learning,%20ESANN%202013.%20Bruges,%20Belgium%2024-26%20April%202013.).
The data values are the means values for the subject and activity type.
The variable subject refers to the observation person, while the
activity type refers to one of 6 activity types that were recorded by
the smartphones. Below is list of the variables and their class.

    ##                                                        Name   Class
    ## 1                                                   subject integer
    ## 2                                                  activity  factor
    ## 3                      timeDomainBodyAccelerometer.Mean...X numeric
    ## 4                      timeDomainBodyAccelerometer.Mean...Y numeric
    ## 5                      timeDomainBodyAccelerometer.Mean...Z numeric
    ## 6                   timeDomainGravityAccelerometer.Mean...X numeric
    ## 7                   timeDomainGravityAccelerometer.Mean...Y numeric
    ## 8                   timeDomainGravityAccelerometer.Mean...Z numeric
    ## 9                  timeDomainBodyAccelerometerJerk.Mean...X numeric
    ## 10                 timeDomainBodyAccelerometerJerk.Mean...Y numeric
    ## 11                 timeDomainBodyAccelerometerJerk.Mean...Z numeric
    ## 12                         timeDomainBodyGyroscope.Mean...X numeric
    ## 13                         timeDomainBodyGyroscope.Mean...Y numeric
    ## 14                         timeDomainBodyGyroscope.Mean...Z numeric
    ## 15                     timeDomainBodyGyroscopeJerk.Mean...X numeric
    ## 16                     timeDomainBodyGyroscopeJerk.Mean...Y numeric
    ## 17                     timeDomainBodyGyroscopeJerk.Mean...Z numeric
    ## 18              timeDomainBodyAccelerometerMagnitude.Mean.. numeric
    ## 19           timeDomainGravityAccelerometerMagnitude.Mean.. numeric
    ## 20          timeDomainBodyAccelerometerJerkMagnitude.Mean.. numeric
    ## 21                  timeDomainBodyGyroscopeMagnitude.Mean.. numeric
    ## 22              timeDomainBodyGyroscopeJerkMagnitude.Mean.. numeric
    ## 23                frequencyDomainBodyAccelerometer.Mean...X numeric
    ## 24                frequencyDomainBodyAccelerometer.Mean...Y numeric
    ## 25                frequencyDomainBodyAccelerometer.Mean...Z numeric
    ## 26            frequencyDomainBodyAccelerometer.MeanFreq...X numeric
    ## 27            frequencyDomainBodyAccelerometer.MeanFreq...Y numeric
    ## 28            frequencyDomainBodyAccelerometer.MeanFreq...Z numeric
    ## 29            frequencyDomainBodyAccelerometerJerk.Mean...X numeric
    ## 30            frequencyDomainBodyAccelerometerJerk.Mean...Y numeric
    ## 31            frequencyDomainBodyAccelerometerJerk.Mean...Z numeric
    ## 32        frequencyDomainBodyAccelerometerJerk.MeanFreq...X numeric
    ## 33        frequencyDomainBodyAccelerometerJerk.MeanFreq...Y numeric
    ## 34        frequencyDomainBodyAccelerometerJerk.MeanFreq...Z numeric
    ## 35                    frequencyDomainBodyGyroscope.Mean...X numeric
    ## 36                    frequencyDomainBodyGyroscope.Mean...Y numeric
    ## 37                    frequencyDomainBodyGyroscope.Mean...Z numeric
    ## 38                frequencyDomainBodyGyroscope.MeanFreq...X numeric
    ## 39                frequencyDomainBodyGyroscope.MeanFreq...Y numeric
    ## 40                frequencyDomainBodyGyroscope.MeanFreq...Z numeric
    ## 41         frequencyDomainBodyAccelerometerMagnitude.Mean.. numeric
    ## 42     frequencyDomainBodyAccelerometerMagnitude.MeanFreq.. numeric
    ## 43     frequencyDomainBodyAccelerometerJerkMagnitude.Mean.. numeric
    ## 44 frequencyDomainBodyAccelerometerJerkMagnitude.MeanFreq.. numeric
    ## 45             frequencyDomainBodyGyroscopeMagnitude.Mean.. numeric
    ## 46         frequencyDomainBodyGyroscopeMagnitude.MeanFreq.. numeric
    ## 47         frequencyDomainBodyGyroscopeJerkMagnitude.Mean.. numeric
    ## 48     frequencyDomainBodyGyroscopeJerkMagnitude.MeanFreq.. numeric
    ## 49                    angle.tBodyAccelerometerMean.gravity. numeric
    ## 50           angle.tBodyAccelerometerJerkMean..gravityMean. numeric
    ## 51                    angle.tBodyGyroscopeMean.gravityMean. numeric
    ## 52                angle.tBodyGyroscopeJerkMean.gravityMean. numeric
    ## 53                                     angle.X.gravityMean. numeric
    ## 54                                     angle.Y.gravityMean. numeric
    ## 55                                     angle.Z.gravityMean. numeric
    ## 56                      timeDomainBodyAccelerometer.STD...X numeric
    ## 57                      timeDomainBodyAccelerometer.STD...Y numeric
    ## 58                      timeDomainBodyAccelerometer.STD...Z numeric
    ## 59                   timeDomainGravityAccelerometer.STD...X numeric
    ## 60                   timeDomainGravityAccelerometer.STD...Y numeric
    ## 61                   timeDomainGravityAccelerometer.STD...Z numeric
    ## 62                  timeDomainBodyAccelerometerJerk.STD...X numeric
    ## 63                  timeDomainBodyAccelerometerJerk.STD...Y numeric
    ## 64                  timeDomainBodyAccelerometerJerk.STD...Z numeric
    ## 65                          timeDomainBodyGyroscope.STD...X numeric
    ## 66                          timeDomainBodyGyroscope.STD...Y numeric
    ## 67                          timeDomainBodyGyroscope.STD...Z numeric
    ## 68                      timeDomainBodyGyroscopeJerk.STD...X numeric
    ## 69                      timeDomainBodyGyroscopeJerk.STD...Y numeric
    ## 70                      timeDomainBodyGyroscopeJerk.STD...Z numeric
    ## 71               timeDomainBodyAccelerometerMagnitude.STD.. numeric
    ## 72            timeDomainGravityAccelerometerMagnitude.STD.. numeric
    ## 73           timeDomainBodyAccelerometerJerkMagnitude.STD.. numeric
    ## 74                   timeDomainBodyGyroscopeMagnitude.STD.. numeric
    ## 75               timeDomainBodyGyroscopeJerkMagnitude.STD.. numeric
    ## 76                 frequencyDomainBodyAccelerometer.STD...X numeric
    ## 77                 frequencyDomainBodyAccelerometer.STD...Y numeric
    ## 78                 frequencyDomainBodyAccelerometer.STD...Z numeric
    ## 79             frequencyDomainBodyAccelerometerJerk.STD...X numeric
    ## 80             frequencyDomainBodyAccelerometerJerk.STD...Y numeric
    ## 81             frequencyDomainBodyAccelerometerJerk.STD...Z numeric
    ## 82                     frequencyDomainBodyGyroscope.STD...X numeric
    ## 83                     frequencyDomainBodyGyroscope.STD...Y numeric
    ## 84                     frequencyDomainBodyGyroscope.STD...Z numeric
    ## 85          frequencyDomainBodyAccelerometerMagnitude.STD.. numeric
    ## 86      frequencyDomainBodyAccelerometerJerkMagnitude.STD.. numeric
    ## 87              frequencyDomainBodyGyroscopeMagnitude.STD.. numeric
    ## 88          frequencyDomainBodyGyroscopeJerkMagnitude.STD.. numeric

To produce the **tidy\_data.txt** data the raw data was collected from
[UCI Machine Learning
Repository](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
The training and test datasets were combined along with the features and
activity labels to provide the column names and activity titles. Once
the raw data sets were combined, the data was subset to only the
valriables measuring the mean or standard deviation of any feature. The
remaining variables were averaged by subject and activity. Some minor
changes were made to the variable names to make them more meaningful.
