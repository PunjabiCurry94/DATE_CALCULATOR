library(lubridate)

calculate_prior_working_date <- function(start_date, days_back, exclude_dates) {
  # Convert inputs to Date format
  start_date <- as.Date(start_date)
  exclude_dates <- as.Date(exclude_dates)
  
  # Initialize counter & date tracker
  current_date <- start_date
  count <- 0
  
  # Loop backwards until we find the correct working date
  while (count < days_back) {
    current_date <- current_date - 1  # Move one day back
    
    # Check if it's a working day (not weekend or excluded)
    if (!(weekdays(current_date) %in% c("Saturday", "Sunday")) & !(current_date %in% exclude_dates)) {
      count <- count + 1
    }
  }
  
  return(format(current_date, "%Y-%m-%d"))
}

# Example usage:
start_date <- "2025-06-17"
days_back <- 10
exclude_dates <- c("2025-06-10", "2025-06-12", "2025-06-14") # Example exclusion dates

prior_working_date <- calculate_prior_working_date(start_date, days_back, exclude_dates)
print(paste("The target working date:", prior_working_date))