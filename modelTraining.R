# Load necessary libraries
library(caret)

# Load the training dataset
train_cars <- readRDS("train_cars_data.rds")

# Set up 5-fold cross-validation
five_fold_control <- trainControl(method = "cv", number = 5)

# Define the hyperparameter grid for k-NN
tuning_grid <- expand.grid(k = 1:20)

# Train the model using k-NN and cross-validation
full_model <- train(
  price ~ .,
  data = train_cars,
  method = "knn",
  trControl = five_fold_control,
  tuneGrid = tuning_grid,
  preProcess = c("center", "scale")
)

# Save the trained model
saveRDS(full_model, file = "knn_model.rds")
