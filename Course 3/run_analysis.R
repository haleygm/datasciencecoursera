library(tidyverse)
library(plyr)

## Steps 1-4
#### Cleaning Training Data ####
# Import Training Data and labels
train1 <- read_delim("~/Google Drive/Coursera/datasciencecoursera/Data/train/subject_train.txt", " ", col_names = F)
train2 <- read_delim("~/Google Drive/Coursera/datasciencecoursera/Data/train/X_train.txt", " ", col_names = F)
train3 <- read_delim("~/Google Drive/Coursera/datasciencecoursera/Data/train/y_train.txt", " ", col_names = F)
feat_labs <- read_delim("~/Google Drive/Coursera/datasciencecoursera/Data/features.txt", " ", col_names = F)
act_labs <- read_delim("~/Google Drive/Coursera/datasciencecoursera/Data/activity_labels.txt", " ", col_names = F)

# Rename variables from train2
old_names <- names(train2)
new_names <- feat_labs$X2 
for (i in 1:length(train2)){
  names(train2)[names(train2) == old_names[i]] = new_names[i]
}

# Rename variables from train3 and turn into vector with proper column name (activity)
act_labels <- act_labs$X2
train3 <- as.character(train3$X1)
names(train3) = "Activity"
for(i in 1:length(train3)){
  if(train3[i] == 1){
    train3[i] = act_labels[1]
  }else if(train3[i] == 2){
    train3[i] = act_labels[2]
  }else if (train3[i] == 3){
    train3[i] = act_labels[3]
  }else if (train3[i] == 4){
    train3[i] = act_labels[4]
  }else if (train3[i] == 5){
    train3[i] = act_labels[5]
  }else if (train3[i] == 6){
    train3[i] = act_labels[6]
  }
}
train3 <- as.data.frame(train3)
names(train3) = "Activity"

# Rename train1 and turn into data.frame 
train1 <- as.data.frame(train1)
names(train1) = "Subject"

# Combine Subject, Activity, and Measurements 
training <- cbind.data.frame(train1, train3, train2)

#Extract all columns with mean and standard deviations 
means_train <- grepl("\\bmean\\b", names(training))
mean_cols <- which(means_train[] == T)
sd_train <- grepl("\\bstd\\b", names(training))
sd_cols <- which(sd_train[] == T)

#Creating Training Data Frame with correct columns, subject column, activity column, and add group identifier 
training <- training[, c(1, 2, mean_cols, sd_cols)]
training$Group <- "Training Sample"

#### Cleaning Test Data ####

# Test Data 
test1 <- read_delim("~/Google Drive/Coursera/datasciencecoursera/Data/test/subject_test.txt", " ", col_names = F)
test2 <- read_delim("~/Google Drive/Coursera/datasciencecoursera/Data/test/X_test.txt", " ", col_names = F)
test3 <- read_delim("~/Google Drive/Coursera/datasciencecoursera/Data/test/y_test.txt", " ", col_names = F)

# Rename variables from test2
old_names <- names(test2)
new_names <- feat_labs$X2 
for (i in 1:length(test2)){
  names(test2)[names(test2) == old_names[i]] = new_names[i]
}

# Rename variables from test3 and turn into vector with proper column name (activity)
act_labels <- act_labs$X2
test3 <- as.character(test3$X1)
names(test3) = "Activity"
for(i in 1:length(test3)){
  if(test3[i] == 1){
    test3[i] = act_labels[1]
  }else if(test3[i] == 2){
    test3[i] = act_labels[2]
  }else if (test3[i] == 3){
    test3[i] = act_labels[3]
  }else if (test3[i] == 4){
    test3[i] = act_labels[4]
  }else if (test3[i] == 5){
    test3[i] = act_labels[5]
  }else if (test3[i] == 6){
    test3[i] = act_labels[6]
  }
}
test3 <- as.data.frame(test3)
names(test3) = "Activity"

# Rename test1 and turn into data.frame 
test1 <- as.data.frame(test1)
names(test1) = "Subject"

# Combine Subject, Activity, and Measurements 
testing <- cbind.data.frame(test1, test3, test2)

#Extract all columns with mean and standard deviations 
means_test <- grepl("\\bmean\\b", names(testing))
mean_cols <- which(means_test[] == T)
sd_test <- grepl("\\bstd\\b", names(testing))
sd_cols <- which(sd_test[] == T)

#Creating Testing Data Frame with correct columns, subject column, activity column, and add group identifier 
testing <- testing[, c(1, 2, mean_cols, sd_cols)]
testing$Group <- "Testing Sample"

#### Creating Full Data Set ####
data <- rbind(training, testing)


#Step 5: From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
#Coerce columns to be numeric rather than character 
data[, 3:68] <- sapply(data[, 3:68], as.numeric)
str(data)

#Sumarise into final data set 
avg_data <- data %>%
  dplyr::group_by(Subject, Activity) %>% 
  dplyr::summarise_all(funs(mean))

#Write Table 
write.table(avg_data, "Averaged_Data.txt", row.names = F)
