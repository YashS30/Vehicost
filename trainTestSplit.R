# Load necessary libraries
library(caret)

# Load the cleaned data
cars <- readRDS("cleaned_cars_data.rds")

# Create train-test split (80% training, 20% testing)
set.seed(123)  # Ensuring reproducibility
split_indices <- createDataPartition(cars$price, p = 0.8, list = FALSE)
train_cars <- cars[split_indices, ]
test_cars <- cars[-split_indices, ]

# Save train and test sets
saveRDS(train_cars, file = "train_cars_data.rds")
saveRDS(test_cars, file = "test_cars_data.rds")
