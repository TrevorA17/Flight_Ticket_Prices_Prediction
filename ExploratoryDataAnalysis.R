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

# Measures of Distribution

# Range
range_duration <- range(flight_data$Duration_in_hours)
range_days_left <- range(flight_data$Days_left)
range_fare <- range(flight_data$Fare)

# Interquartile Range (IQR)
IQR_duration <- IQR(flight_data$Duration_in_hours)
IQR_days_left <- IQR(flight_data$Days_left)
IQR_fare <- IQR(flight_data$Fare)

# Variance
var_duration <- var(flight_data$Duration_in_hours)
var_days_left <- var(flight_data$Days_left)
var_fare <- var(flight_data$Fare)

# Standard Deviation
sd_duration <- sd(flight_data$Duration_in_hours)
sd_days_left <- sd(flight_data$Days_left)
sd_fare <- sd(flight_data$Fare)

# Display Measures of Distribution
cat("Range Duration (in hours):", range_duration, "\n")
cat("Range Days Left:", range_days_left, "\n")
cat("Range Fare:", range_fare, "\n\n")

cat("Interquartile Range (IQR) Duration (in hours):", IQR_duration, "\n")
cat("Interquartile Range (IQR) Days Left:", IQR_days_left, "\n")
cat("Interquartile Range (IQR) Fare:", IQR_fare, "\n\n")

cat("Variance Duration (in hours):", var_duration, "\n")
cat("Variance Days Left:", var_days_left, "\n")
cat("Variance Fare:", var_fare, "\n\n")

cat("Standard Deviation Duration (in hours):", sd_duration, "\n")
cat("Standard Deviation Days Left:", sd_days_left, "\n")
cat("Standard Deviation Fare:", sd_fare, "\n")

# Measures of Relationship

# Correlation between numerical variables
correlation_matrix <- cor(flight_data[c("Duration_in_hours", "Days_left", "Fare")])

# Covariance between numerical variables
covariance_matrix <- cov(flight_data[c("Duration_in_hours", "Days_left", "Fare")])

# Display Measures of Relationship
cat("Correlation Matrix:\n")
print(correlation_matrix)
cat("\n")

cat("Covariance Matrix:\n")
print(covariance_matrix)

# Load required libraries
library(dplyr)

# Perform ANOVA tests

# ANOVA by Airline
anova_airline <- aov(Fare ~ Airline, data = flight_data)
summary(anova_airline)

# ANOVA by Class
anova_class <- aov(Fare ~ Class, data = flight_data)
summary(anova_class)

# ANOVA by Total Stops
anova_stops <- aov(Fare ~ Total_stops, data = flight_data)
summary(anova_stops)

# Load required libraries
library(ggplot2)

# Univariate Plots

# Histogram for Duration_in_hours
ggplot(flight_data, aes(x = Duration_in_hours)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Duration (in hours)",
       x = "Duration (hours)", y = "Frequency") +
  theme_minimal()

# Histogram for Days_left
ggplot(flight_data, aes(x = Days_left)) +
  geom_histogram(binwidth = 1, fill = "lightgreen", color = "black") +
  labs(title = "Histogram of Days Left",
       x = "Days Left", y = "Frequency") +
  theme_minimal()

# Histogram for Fare
ggplot(flight_data, aes(x = Fare)) +
  geom_histogram(binwidth = 500, fill = "lightcoral", color = "black") +
  labs(title = "Histogram of Fare",
       x = "Fare", y = "Frequency") +
  theme_minimal()

# Load required libraries
library(ggplot2)

# Multivariate Plots

# Scatter plot between Duration_in_hours and Fare colored by Airline
ggplot(flight_data, aes(x = Duration_in_hours, y = Fare, color = Airline)) +
  geom_point() +
  labs(title = "Duration vs Fare by Airline",
       x = "Duration (hours)", y = "Fare") +
  theme_minimal()

# Box plot of Fare by Class
ggplot(flight_data, aes(x = Class, y = Fare, fill = Class)) +
  geom_boxplot() +
  labs(title = "Boxplot of Fare by Class",
       x = "Class", y = "Fare") +
  theme_minimal()

# Bar plot of Total stops
ggplot(flight_data, aes(x = Total_stops, fill = Total_stops)) +
  geom_bar() +
  labs(title = "Bar plot of Total stops",
       x = "Total Stops", y = "Count") +
  theme_minimal()
