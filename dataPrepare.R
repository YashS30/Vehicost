# Load necessary libraries
library(readr)
library(tidyr)
library(dplyr)

# Load the data
cars <- read.csv("imports-85.data")

# Fixing the column names
colnames(cars) <- c(
  "symboling", "normalized_losses", "make", "fuel_type", "aspiration",
  "num_doors", "body_style", "drive_wheels", "engine_location", "wheel_base",
  "length", "width", "height", "curb_weight", "engine_type", "num_cylinders",
  "engine_size", "fuel_system", "bore", "stroke", "compression_ratio",
  "horsepower", "peak_rpm", "city_mpg", "highway_mpg", "price"
)

# Select relevant numeric columns and filter out missing data
cars <- cars %>%
  select(
    symboling, wheel_base, length, width, height, curb_weight, engine_size, bore, 
    stroke, compression_ratio, horsepower, peak_rpm, city_mpg, highway_mpg, price
  ) %>%
  filter(
    stroke != "?", bore != "?", horsepower != "?", peak_rpm != "?", price != "?"
  ) %>%
  mutate(
    stroke = as.numeric(stroke),
    bore = as.numeric(bore),
    horsepower = as.numeric(horsepower),
    peak_rpm = as.numeric(peak_rpm),
    price = as.numeric(price)
  )

# Verify the column types
library(purrr)
map(cars, typeof)

# Save cleaned dataset
saveRDS(cars, file = "cleaned_cars_data.rds")
