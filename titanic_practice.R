# Auther:Eli Temanson
# From DataCamp.com titanic R tutorial
#
# Import the training set: train
train_url <- "http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/train.csv"
train <- read.csv(train_url)
  
# Import the testing set: test
test_url <- "http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/test.csv"
test <- read.csv(test_url)
  
# Print train and test to the console
train
test

# Your train and test set are still loaded
str(train)
str(test)

# Survival rates in absolute numbers
table(train$Survived)

# As proportions
prop.table(table(train$Survived))
  
# Two-way comparison: Sex and Survived
table(train$Sex, train$Survived)

# Two-way comparison: row-wise proportions
prop.table(table(train$Sex, train$Survived), 1)
