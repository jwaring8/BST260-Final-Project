# Load the caret package
library(caret)

# Import dataset
dat <- read.csv("../dataset/clean_diabetic_data.csv")

# Create the training and test datasets
set.seed(123)

# Step 1: Get row numbers for the training data (80% train split, 20% testing split)
trainRowNumbers <- createDataPartition(dat$readmitted, p=0.8, list=FALSE)

# Step 2: Create the training  dataset
trainData <- dat[trainRowNumbers,]

# Step 3: Create the test dataset
testData <- dat[-trainRowNumbers,]

# Step 4: Save the datasets 
write.csv(trainData, file = "../dataset/trainData.csv", row.names = F)
write.csv(testData, file = "../dataset/testData.csv", row.names = F)
