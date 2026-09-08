#Author: Brown, Joshua
# 1. Use dataset named "airquality" in R.
data(airquality)
airquality <- na.omit(airquality)  # remove NA's so scatter plot / model work cleanly
 
# 2. Plot the data as a scatter plot for variables "Ozone" and "Day".
plot(airquality$Day, airquality$Ozone,
     xlab = "Day", ylab = "Ozone",
     main = "Ozone vs Day - Scatter Plot")
 
# 3. Create a regression model for a 50% split of the "airquality" dataset
#    with variables "Ozone" and "Day", main = "OzoneVSday". Save plot as OzoneVSday.pdf
set.seed(123)  # for reproducibility
n <- nrow(airquality)
train_index <- sample(seq_len(n), size = 0.5 * n)
 
train_data <- airquality[train_index, ]
test_data  <- airquality[-train_index, ]
 
# Fit linear regression model: Ozone as a function of Day
model <- lm(Ozone ~ Day, data = train_data)
summary(model)
 
# Save the regression plot as OzoneVSday.pdf
pdf("OzoneVSday.pdf")
plot(train_data$Day, train_data$Ozone,
     xlab = "Day", ylab = "Ozone", main = "OzoneVSday")
abline(model, col = "red", lwd = 2)
dev.off()
 
# 4. Print predictions for the test data (the other 50% split)
predictions <- predict(model, newdata = test_data)
print(predictions)
 
# ---- Predictions (paste-in output) ----
# The block below is the printed output of predict(), pasted at the end
# of this file as required.
 
#       1        2        3        4        7        8       12       14 
#46.86297 46.54840 46.23383 45.91926 44.97556 44.66099 43.40271 42.77357 
#      15       16       20       21       23       24       29       31 
#42.45900 42.14443 40.88615 40.57158 39.94245 39.62788 38.05503 37.42589 
#      44       47       48       63       66       68       69       74 
#43.08814 42.14443 41.82986 46.54840 45.60469 44.97556 44.66099 43.08814 
#      76       77       78       79       80       85       87       88 
#42.45900 42.14443 41.82986 41.51529 41.20072 39.62788 38.99874 38.68417 
#      89       91       92       94       95      100      101      104 
#38.36960 37.74046 37.42589 46.54840 46.23383 44.66099 44.34642 43.40271 
#     109      110      112      114      117      121      126      127 
#41.82986 41.51529 40.88615 40.25701 39.31331 38.05503 46.23383 45.91926 
#     128      130      138      143      146      148      151      153 
#45.60469 44.97556 42.45900 40.88615 39.94245 39.31331 38.36960 37.74046 
>  

