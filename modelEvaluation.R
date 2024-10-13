# Load necessary libraries
library(caret)

# Load the trained model and the test dataset
full_model <- readRDS("knn_model.rds")
test_cars <- readRDS("test_cars_data.rds")

# Make predictions on the test data
predictions <- predict(full_model, newdata = test_cars)

# Evaluate the model
evaluation_metrics <- postResample(pred = predictions, obs = test_cars$price)

# Print out the evaluation metrics
print(evaluation_metrics)
