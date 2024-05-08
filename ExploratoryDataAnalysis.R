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
