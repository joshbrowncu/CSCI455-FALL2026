#Author: Brown, Date 10/8/2026, Purpose: Set up a neural network



# Load packages
library(caret)
# install.packages("randomForest")  # run once if not installed; caret's "rf" needs it

# Load dataset
dataset <- iris

# Split into training (80%) and validation (20%)
set.seed(7)
validation_index <- createDataPartition(dataset$Species, p = 0.80, list = FALSE)
validation <- dataset[-validation_index, ]   # 20% held out for testing
dataset    <- dataset[validation_index, ]    # 80% for training

# 10-fold cross-validation, measuring Accuracy
control <- trainControl(method = "cv", number = 10)
metric  <- "Accuracy"

# Train the model using Random Forest
set.seed(7)
fit.rf <- train(Species ~ ., data = dataset, method = "rf",
                metric = metric, trControl = control)

# Predictions on the validation dataset
predictions <- predict(fit.rf, validation)

# Evaluate
print(fit.rf)
confusionMatrix(predictions, validation$Species)

# Random Forrest Evaluation Results
Random Forest 

120 samples
  4 predictor
  3 classes: 'setosa', 'versicolor', 'virginica' 

No pre-processing
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 108, 108, 108, 108, 108, 108, ... 
Resampling results across tuning parameters:

  mtry  Accuracy   Kappa 
  2     0.9416667  0.9125
  3     0.9500000  0.9250
  4     0.9500000  0.9250

Accuracy was used to select the optimal model using the largest value.
The final value used for the model was mtry = 3.

# Confusion Matrix Results
Confusion Matrix and Statistics

            Reference
Prediction   setosa versicolor virginica
  setosa         10          0         0
  versicolor      0         10         1
  virginica       0          0         9

Overall Statistics
                                          
               Accuracy : 0.9667          
                 95% CI : (0.8278, 0.9992)
    No Information Rate : 0.3333          
    P-Value [Acc > NIR] : 2.963e-13       
                                          
                  Kappa : 0.95            
                                          
 Mcnemar's Test P-Value : NA              

Statistics by Class:

                     Class: setosa Class: versicolor Class: virginica
Sensitivity                 1.0000            1.0000           0.9000
Specificity                 1.0000            0.9500           1.0000
Pos Pred Value              1.0000            0.9091           1.0000
Neg Pred Value              1.0000            1.0000           0.9524
Prevalence                  0.3333            0.3333           0.3333
Detection Rate              0.3333            0.3333           0.3000
Detection Prevalence        0.3333            0.3667           0.3000
Balanced Accuracy           1.0000            0.9750           0.9500
> 


