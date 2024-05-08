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

# Load required libraries
library(caret)

# Set seed for reproducibility
set.seed(123)

# Split the data into training and testing sets (80% training, 20% testing)
train_index <- createDataPartition(flight_data$Fare, p = 0.8, list = FALSE)
train_data <- flight_data[train_index, ]
test_data <- flight_data[-train_index, ]

# Print the dimensions of the training and testing sets
cat("Training set dimensions:", dim(train_data), "\n")
cat("Testing set dimensions:", dim(test_data), "\n")

# Set seed for reproducibility
set.seed(123)

# Number of bootstrap samples
num_samples <- 1000

# Perform bootstrapping on the Fare variable
boot_samples <- numeric(num_samples)
for (i in 1:num_samples) {
  # Generate bootstrap sample with replacement
  bootstrap_sample <- sample(flight_data$Fare, replace = TRUE)
  # Compute statistic of interest (e.g., mean)
  boot_samples[i] <- mean(bootstrap_sample)
}

# Summary statistics of the bootstrap samples
summary_boot <- summary(boot_samples)

# Display summary statistics
print(summary_boot)

# Load required libraries
library(caret)

# Set seed for reproducibility
set.seed(123)

# Sample a smaller portion of the dataset for training (e.g., 20% of the data)
sampled_indices <- sample(1:nrow(flight_data), size = 0.2 * nrow(flight_data))
sampled_data <- flight_data[sampled_indices, ]

# Define the number of folds for cross-validation
num_folds <- 10

# Define the control parameters for cross-validation
ctrl <- trainControl(method = "cv",  # Cross-validation method
                     number = num_folds,  # Number of folds
                     verboseIter = TRUE)  # Display progress

# Define the model training function
cv_model <- train(Fare ~ .,  # Regression formula
               data = sampled_data,  # Sampled dataset
               method = "lm",  # Linear regression
               trControl = ctrl)  # Cross-validation control parameters

# View the cross-validation results
print(cv_model)
# Load required libraries
library(caret)

# Set seed for reproducibility
set.seed(123)

# Define the number of folds for cross-validation
num_folds <- 10

# Define the control parameters for cross-validation
ctrl <- trainControl(method = "cv",  # Cross-validation method
                     number = num_folds,  # Number of folds
                     verboseIter = TRUE)  # Display progress

# Train Linear Regression model
lm_model <- train(Fare ~ .,  # Regression formula
                  data = sampled_data,  # Sampled dataset
                  method = "lm",  # Linear regression
                  trControl = ctrl)  # Cross-validation control parameters

# Evaluate Linear Regression model
lm_performance <- resamples(list(Linear_Regression = lm_model))

# Train Ridge Regression model
ridge_model <- train(Fare ~ .,  # Regression formula
                     data = sampled_data,  # Sampled dataset
                     method = "ridge",  # Ridge regression
                     trControl = ctrl)  # Cross-validation control parameters

# Evaluate Ridge Regression model
ridge_performance <- resamples(list(Ridge_Regression = ridge_model))

# Train Lasso Regression model
lasso_model <- train(Fare ~ .,  # Regression formula
                     data = sampled_data,  # Sampled dataset
                     method = "lasso",  # Lasso regression
                     trControl = ctrl)  # Cross-validation control parameters

# Evaluate Lasso Regression model
lasso_performance <- resamples(list(Lasso_Regression = lasso_model))

# Train Elastic Net model
enet_model <- train(Fare ~ .,  # Regression formula
                    data = sampled_data,  # Sampled dataset
                    method = "enet",  # Elastic Net
                    trControl = ctrl)  # Cross-validation control parameters

# Evaluate Elastic Net model
enet_performance <- resamples(list(Elastic_Net = enet_model))

# Train Random Forest model
rf_model <- train(Fare ~ .,  # Regression formula
                  data = sampled_data,  # Sampled dataset
                  method = "rf",  # Random forest
                  trControl = ctrl)  # Cross-validation control parameters

# Evaluate Random Forest model
rf_performance <- resamples(list(Random_Forest = rf_model))

# Train Gradient Boosting Machine model
gbm_model <- train(Fare ~ .,  # Regression formula
                   data = sampled_data,  # Sampled dataset
                   method = "gbm",  # Gradient Boosting Machine
                   trControl = ctrl)  # Cross-validation control parameters

# Evaluate Gradient Boosting Machine model
gbm_performance <- resamples(list(Gradient_Boosting_Machine = gbm_model))

# Print performance metrics
summary(lm_performance)
summary(ridge_performance)
summary(lasso_performance)
summary(enet_performance)
summary(rf_performance)
summary(gbm_performance)

# Compare model performances using resamples
model_comparisons <- resamples(list(Linear_Regression = lm_model,
                                    Ridge_Regression = ridge_model,
                                    Lasso_Regression = lasso_model,
                                    Elastic_Net = enet_model,
                                    Random_Forest = rf_model,
                                    Gradient_Boosting_Machine = gbm_model))

# Summarize model comparisons
summary(model_comparisons)
