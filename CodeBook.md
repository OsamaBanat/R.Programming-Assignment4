# CodeBook

Variables:

- subject: identifies the subject who performed the activity for each window sample.

- y: label of type of activity performed (WALKING, SITTING, etc.).

- remaining variables: Sensor measurements related to mean and standard deviation signals from accelerometer and gyroscope data.

  ---
  
Data cleaning steps performed in run_analysis.R:

1. Loaded training and test datasets.

2. Assigned descriptive variable names using features.txt.

3. Merged the training and test datasets into one dataset.

4. Extracted only variables containing mean() and std() measurements.

5. Replaced activity IDs with descriptive activity names.

6. Cleaned variable names for readability.

7. Created a second tidy dataset containing the average of each variable for each activity and each subject.

8. Exported the final tidy dataset to tidy_data.txt.

9. The data used in this project come from the Human Activity Recognition Using Smartphones Dataset.

The final output file is tidy_data.txt.

The dataset contains the average of each selected variable grouped by subject and activity.

---
License

The dataset includes measurements collected from smartphone accelerometers and gyroscopes from subjects performing different physical activities.

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
