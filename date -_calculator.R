# Function to compute date difference while excluding specific dates
compute_days_excluding <- function(start_date, end_date, exclusion_dates) {
  # Convert inputs to Date format
  start_date <- as.Date(start_date)
  end_date <- as.Date(end_date)
  exclusion_dates <- as.Date(exclusion_dates)
  
  # Generate sequence of all days between start and end dates
  all_days <- seq(start_date, end_date, by = "day")
  
  # Remove days that are in exclusion list
  valid_days <- setdiff(all_days, exclusion_dates)
  
  # Return the count of valid days
  return(length(valid_days))
}

# Example Usage
start_date <- "2025-06-01"
end_date <- "2025-06-14"
exclusion_dates <- c("2025-06-04", "2025-06-07", "2025-06-10")

# Compute days excluding certain dates
days_count <- compute_days_excluding(start_date, end_date, exclusion_dates)

# Print result
print(days_count)