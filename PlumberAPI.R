# Load the saved linear regression model
loaded_lm_model <- readRDS("./models/saved_lm_model.rds")

#* @apiTitle Flight Ticket Price Prediction API
#* @apiDescription Used to predict flight ticket prices.

#* @param Date_of_journey Date of the journey (e.g., "21-05-24")
#* @param Journey_day Day of the journey (e.g., "Friday")
#* @param Airline Airline name (e.g., "IndiGo")
#* @param Flight_code Flight code (e.g., "6E-2758")
#* @param Class Class of travel (e.g., "Economy")
#* @param Source Source city (e.g., "Delhi")
#* @param Departure Departure time (e.g., "After 6 PM")
#* @param Total_stops Total stops in the journey (e.g., "non-stop")
#* @param Arrival Arrival time (e.g., "Before 6 AM")
#* @param Destination Destination city (e.g., "Mumbai")
#* @param Duration_in_hours Duration of the journey in hours (e.g., 2.5)
#* @param Days_left Days left for the journey

#* @get /predict_flight_ticket_price
predict_flight_ticket_price <- function(Date_of_journey, Journey_day, Airline, Flight_code, Class, Source, Departure, Total_stops, Arrival, Destination, Duration_in_hours, Days_left) {
  
  # Create a data frame using the arguments
  new_data <- data.frame(
    Date_of_journey = as.character(Date_of_journey),
    Journey_day = as.factor(Journey_day),
    Airline = as.factor(Airline),
    Flight_code = as.character(Flight_code),
    Class = as.factor(Class),
    Source = as.factor(Source),
    Departure = as.factor(Departure),
    Total_stops = as.factor(Total_stops),
    Arrival = as.factor(Arrival),
    Destination = as.factor(Destination),
    Duration_in_hours = as.numeric(Duration_in_hours),
    Days_left = as.integer(Days_left)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_lm_model, newdata = new_data)
  
  # Return the prediction
  return(prediction)
}
s