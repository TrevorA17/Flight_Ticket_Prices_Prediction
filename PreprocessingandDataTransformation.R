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