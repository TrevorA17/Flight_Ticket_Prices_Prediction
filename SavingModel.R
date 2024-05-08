# Saving the linear regression model
saveRDS(lm_model, "./models/saved_lm_model.rds")

# Load the saved model
loaded_lm_model <- readRDS("./models/saved_lm_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  Date_of_journey = "21-05-24",
  Journey_day = "Friday",
  Airline = "IndiGo",
  Flight_code = "6E-2758",
  Class = "Economy",
  Source = "Delhi",
  Departure = "After 6 PM",
  Total_stops = "non-stop",
  Arrival = "Before 6 AM",
  Destination = "Mumbai",
  Duration_in_hours = 2.5,
  Days_left = 5
)

# Use the loaded model to make predictions
predictions_loaded_model <- predict(loaded_lm_model, newdata = new_data)

# Print predictions
print(predictions_loaded_model)
