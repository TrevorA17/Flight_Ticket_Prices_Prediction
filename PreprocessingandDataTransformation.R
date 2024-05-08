# Load dataset
flight_data <- read.csv("data/flight_prices.csv", colClasses = c(
  Date_of_journey = "character",
  Journey_day = "factor",
  Airline = "factor",
  Flight_code = "character",
  Class = "factor",
  Source = "factor",
  Departure = "factor",
  Total_stops = "factor",
  Arrival = "factor",
  Destination = "factor",
  Duration_in_hours = "numeric",
  Days_left = "integer",
  Fare = "numeric"
))

# Display the structure of the dataset
str(flight_data)

# View the first few rows of the dataset
head(flight_data)

# View the dataset in a separate viewer window
View(flight_data)

# Count missing values in each column
missing_values <- colSums(is.na(flight_data))

# Display columns with missing values
print("Columns with Missing Values:")
print(names(missing_values[missing_values > 0]))

# Display total number of missing values
print("Total Number of Missing Values:")
print(sum(missing_values))

# Round off Fare column to 2 decimal places
flight_data$Fare <- round(flight_data$Fare, 2)

View(flight_data)

# Scaling numerical variables (e.g., Duration_in_hours and Days_left)
flight_data$Duration_scaled <- scale(flight_data$Duration_in_hours)
flight_data$Days_left_scaled <- scale(flight_data$Days_left)

# Log transformation of Fare
flight_data$Fare_log <- log(flight_data$Fare + 1)  # Adding 1 to handle zero fares

