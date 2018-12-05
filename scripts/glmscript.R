library(tidyverse)
library(foreign)
library(VGAM)
library(caret)
library(glmnet)

dat <- read_csv("./dataset/testData.csv")
dat <- dat %>% mutate(y = ifelse(dat$readmitted == 0, 0, 1))

# Step 1: Get row numbers for the training data (80% train split, 20% testing split)
trainRowNumbers <- createDataPartition(dat$readmitted, p=0.8, list=FALSE)

# Step 2: Create the training dataset
trainData <- dat[trainRowNumbers,]

# Step 3: Create the test dataset
testData <- dat[-trainRowNumbers,]

x<- trainData %>% select(-c(readmitted,y))
x <- as.matrix(x)
new_x<- testData %>% select(-c(readmitted,y))
new_x <- as.matrix(new_x)

# polynomial model, no readmission vs. >= 30d vs < 30d

fit <- glmnet(x, trainData$readmitted, family = "multinomial", type.multinomial = "grouped", a = 0.5)
plot(fit, xvar = "lambda", label = TRUE, type.coef = "2norm")
cvfit=cv.glmnet(x, trainData$readmitted, family="multinomial", parallel = TRUE)
plot(cvfit)
coef(cvfit, s = "lambda.1se")

pred_y <- predict(cvfit, newx = new_x, s = "lambda.1se", type = "class")

confusionMatrix(data = as.factor(pred_y), reference = as.factor(testData$readmitted))

# binomial model, no readmission vs. any readmission (>=30d and <30d)
fit2 <- glmnet(x, trainData$y, family = "binomial", a = 0.5)
plot(fit, xvar = "lambda", label = TRUE, type.coef = "2norm")
cvfit2=cv.glmnet(x, trainData$y, family="binomial", parallel = TRUE)
plot(cvfit2)
coef(cvfit2, s = "lambda.1se")

pred_y2 <- predict(cvfit2, newx = new_x, s = "lambda.1se", type = "class")

confusionMatrix(data = as.factor(pred_y2), reference = as.factor(testData$y))