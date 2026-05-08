##read the files
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

##change the columns' names
colnames(X_train) <- features[,2]
colnames(X_test) <- features[,2]

##merge the data
test_data <- cbind(subject_test, y_test, X_test)
train_data <- cbind(subject_train, y_train, X_train)
all_data <- rbind(test_data, train_data)

##renaming the columns
colnames(all_data)[1] <- "subject"
colnames(all_data)[2] <- "y"

## extract mean and SD
mean_std <- grep("mean\\(\\)|std\\(\\)", colnames(all_data))
data.md <- all_data[,mean_std]

##descriptive activity names translation
all_data$y <- activity_labels[all_data$y,2]

##Appropriately naming the labels 
colnames (all_data) <- gsub ("mean\\(\\)", "Mean value", colnames (all_data))
colnames (all_data) <- gsub ("std\\(\\)", "Standard deviation", colnames (all_data))
colnames (all_data) <- gsub ("mad\\(\\)", "Median absolute deviation", colnames (all_data))
colnames (all_data) <- gsub ("max\\(\\)", "Largest value in array", colnames (all_data))
colnames (all_data) <- gsub ("min\\(\\)", "Smallest value in array", colnames (all_data))
colnames (all_data) <- gsub ("sma\\(\\)", "Signal magnitude area", colnames (all_data))
colnames (all_data) <- gsub ("energy\\(\\)", "Energy measure. Sum of the squares divided by the number of values", colnames (all_data))
colnames (all_data) <- gsub ("iqr\\(\\)", "Interquartile range", colnames (all_data))
colnames (all_data) <- gsub ("entropy\\(\\)", "Signal entropy", colnames (all_data))
colnames (all_data) <- gsub ("arCoeff\\(\\)", "Autorregresion coefficients with Burg order equal to 4", colnames (all_data))
colnames (all_data) <- gsub ("correlation\\(\\)", "correlation coefficient between two signals", colnames (all_data))
colnames (all_data) <- gsub ("maxInds\\(\\)", "index of the frequency component with largest magnitude", colnames (all_data))
colnames (all_data) <- gsub ("meanFreq\\(\\)", "Weighted average of the frequency components to obtain a mean frequency", colnames (all_data))
colnames (all_data) <- gsub ("skewness\\(\\)", "skewness of the frequency domain signal", colnames (all_data))
colnames (all_data) <- gsub ("kurtosis\\(\\)", "kurtosis of the frequency domain signal", colnames (all_data))
colnames (all_data) <- gsub ("bandsEnergy\\(\\)", "Energy of a frequency interval within the 64 bins of the FFT of each window.", colnames (all_data))
colnames (all_data) <- gsub ("angle\\(\\)", "Angle between to vectors", colnames (all_data))

##coerced to syntactically valid names due to duplication in columns' names
colnames (all_data) <- make.names(colnames (all_data), unique = T)

##creates a second, independent tidy data set
library(dplyr)
tidy_data <- all_data %>%
   group_by(subject, y) %>%
   summarize(across(everything(), mean))

## export tidy_data  
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
