library(tidyverse)
library(foreign)
library(VGAM)
library(caret)
library(glmnet)

dat <- read_csv("./dataset/trainData.csv")

# Step 1: Get row numbers for the training data (80% train split, 20% testing split)
trainRowNumbers <- createDataPartition(dat$readmitted, p=0.8, list=FALSE)

# Step 2: Create the training dataset
trainData <- dat[trainRowNumbers,]

# Step 3: Create the test dataset
testData <- dat[-trainRowNumbers,]

x<- trainData %>% select(-c(readmitted))
x <- as.matrix(x)
new_x<- testData %>% select(-c(readmitted))
new_x <- as.matrix(new_x)

# polynomial model, no readmission vs. >= 30d vs < 30d

fit <- glmnet(x, trainData$readmitted, family = "binomial")
plot(fit, xvar = "dev", label = TRUE)
cvfit=cv.glmnet(x, trainData$readmitted, family="binomial", parallel = TRUE)
plot(cvfit)
coef(cvfit, s = "lambda.1se")

pred_y <- predict(cvfit, newx = new_x, s = "lambda.1se", type = "class")

confusionMatrix(data = as.factor(pred_y), reference = as.factor(testData$readmitted))


