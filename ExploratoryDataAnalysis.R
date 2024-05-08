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

#Measures of Frequency
# Frequency of Journey Day
journey_day_frequency <- table(flight_data$Journey_day)

# Frequency of Airline
airline_frequency <- table(flight_data$Airline)

# Frequency of Class
class_frequency <- table(flight_data$Class)

# Frequency of Source
source_frequency <- table(flight_data$Source)

# Frequency of Departure
departure_frequency <- table(flight_data$Departure)

# Frequency of Total Stops
total_stops_frequency <- table(flight_data$Total_stops)

# Frequency of Arrival
arrival_frequency <- table(flight_data$Arrival)

# Frequency of Destination
destination_frequency <- table(flight_data$Destination)

# Display the frequency measures
journey_day_frequency
airline_frequency
class_frequency
source_frequency
departure_frequency
total_stops_frequency
arrival_frequency
destination_frequency

# Measures of Central Tendency

# Mean
mean_duration <- mean(flight_data$Duration_in_hours)
mean_days_left <- mean(flight_data$Days_left)
mean_fare <- mean(flight_data$Fare)

# Median
median_duration <- median(flight_data$Duration_in_hours)
median_days_left <- median(flight_data$Days_left)
median_fare <- median(flight_data$Fare)

# Mode (as there is no built-in function for mode in R, you can create a custom function)
get_mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

mode_duration <- get_mode(flight_data$Duration_in_hours)
mode_days_left <- get_mode(flight_data$Days_left)
mode_fare <- get_mode(flight_data$Fare)

# Display Measures of Central Tendency
cat("Mean Duration (in hours):", mean_duration, "\n")
cat("Median Duration (in hours):", median_duration, "\n")
cat("Mode Duration (in hours):", mode_duration, "\n\n")

cat("Mean Days Left:", mean_days_left, "\n")
cat("Median Days Left:", median_days_left, "\n")
cat("Mode Days Left:", mode_days_left, "\n\n")

cat("Mean Fare:", mean_fare, "\n")
cat("Median Fare:", median_fare, "\n")
cat("Mode Fare:", mode_fare, "\n")
