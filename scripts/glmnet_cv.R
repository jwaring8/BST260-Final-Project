library(tidyverse)
library(foreign)
library(VGAM)
library(caret)
library(glmnet)

trainData <- read.csv("./dataset/trainSMOTE.csv")
trainData <- trainData %>% mutate(readmitted = as.factor(readmitted))
testData <- read.csv("./dataset/testData.csv")
testData <- testData %>% mutate(readmitted = as.factor(readmitted))

# set up 10-fold partition
cv_splits <- createFolds(dat$readmitted, k = 10, returnTrain = TRUE)
str(cv_splits)

# fit glmnet using adaptive lasso using a range of alpha and lambdas
glmnet_grid <- expand.grid(alpha = c(0,  .1,  .2, .4, .6, .8, 1),
                           lambda = seq(.01, .2, length = 20))
glmnet_ctrl <- trainControl(method = "cv", number = 10)

glmnet_fit <- train(readmitted ~ ., data = trainData,
                    method = "glmnet",
                    family = "binomial",
                    preProcess = c("center", "scale"),
                    tuneGrid = glmnet_grid,
                    trControl = glmnet_ctrl)
glmnet_fit

# plot acuracy against tuning parameters
trellis.par.set(caretTheme())
plot(glmnet_fit, scales = list(x = list(log = 2)))

# predict outcome using test set
pred_classes <- predict(glmnet_fit, newdata = testData, type = "raw")
table(pred_classes)
confusionMatrix(data = as.factor(pred_classes), reference = as.factor(testData$readmitted))

# calculate AUC
library(pROC)
auc <- roc(testData$readmitted, as.numeric(pred_classes))
ggroc(auc) + ggtitle("ROC curve of GLMnet with 10-fold validation")
print(auc$auc)

plot(varImp(glmnet_fit,scale=F))
coef(glmnet_fit$finalModel, s = glmnet_fit$bestTune$lambda)
