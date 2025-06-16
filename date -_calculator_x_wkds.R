library(lubridate)

# Function to calculate working days excluding specific dates and weekends
calculate_working_days <- function(start_date, end_date, excluded_dates) {
  # Convert inputs to Date format
  start_date <- as.Date(start_date, format = "%Y-%m-%d")
  end_date <- as.Date(end_date, format = "%Y-%m-%d")
  
  # Ensure start_date is earlier than end_date
  if (start_date > end_date) {
    temp <- start_date
    start_date <- end_date
    end_date <- temp
  }
  
  # Generate sequence of all dates between start_date and end_date
  all_dates <- seq(start_date, end_date, by = "day")
  
  # Convert excluded dates to Date format
  excluded_dates <- as.Date(excluded_dates, format = "%Y-%m-%d")
  
  # Filter out weekends and excluded dates
  working_days <- all_dates[!(weekdays(all_dates) %in% c("Saturday", "Sunday"))]
  working_days <- working_days[!(working_days %in% excluded_dates)]
  
  # Return count of working days
  return(length(working_days))
}

# Example usage
excluded_dates <- c("2025-06-10", "2025-06-12") # List of dates to exclude
start_date <- "2025-06-16"
end_date <- "2025-06-26"

working_days_count <- calculate_working_days(start_date, end_date, excluded_dates)
print(paste("Working days count:", working_days_count))