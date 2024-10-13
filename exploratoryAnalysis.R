# Load necessary libraries
library(caret)
library(ggplot2)

# Load the cleaned data
cars <- readRDS("cleaned_cars_data.rds")

# Visualize relationships between features and price
featurePlot(cars, cars$price)

# Plot the distribution of car prices
ggplot(cars, aes(x = price)) +
  geom_histogram(color = "red") +
  labs(
    title = "Distribution of prices in cars dataset",
    x = "Price",
    y = "Frequency"
  )

# Note: We noticed that some cars have a price of zero, which might be problematic.
