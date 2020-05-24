==================================================================
Tidy Data Assignment: Getting and Cleaning Data - Coursera
Version 1.0
Note: Information about project is taken from the original Readme for those interested. 
==================================================================
Data Source

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
Experiment Information: (Given)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'Data_Dictionary.txt': List of all variables and unit of observation (codebook)

- 'run_analysis.R': Script to create full and averaged tidy data set

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Range from 1-30 (observation identifiers)

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Range from 1-30 (observation identifiers)

- 'activity_labels.txt': Links the class labels with their activity name.

- 'features.txt': Provides the variable name for each column in X_test.txt and X_train.txt 

- 'Data/train/X_train.txt': Training set (variable measurements)

- 'Data/train/y_train.txt': Training labels (activity)

- 'Data/test/X_test.txt': Test set (variable measurements)

- 'Data/test/y_test.txt': Test labels (activity)

- 'Averaged_Data.csv': Final tidy data set of average for each subject-activity combination's variables


Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws


Analysis Steps:
======================================
For each data set (testing/training)
1. Import data
2. Clean data by properly labelling activity ('y' files) and measurement variables ('x' files)
3. Bind subject, activity, and feature columns once properly labelled 
4. Label individuals as testing or training group 
5. Repeat for other group (testing or training) 

6. Bind rows of testing and training group 
7. Transform all feature variables to numerics (they went in as characters originally)
8. Calculate mean for each subject-activity combinations' features (ie: mean of the mean feature and mean of the std dev. feature)
9. Write final data table  

Note, only working directory must be changed in run_analysis to obtain my data sets. 


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
