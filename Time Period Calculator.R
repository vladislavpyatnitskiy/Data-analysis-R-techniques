date.calculator <- function(s = NULL, e = NULL, words = T,
                            text = "Time period is %s days"){

  if (s > e) return(message("End date cannot be earlier than Start date"))
  
  D <- as.numeric(as.Date(e) - as.Date(s)) # Calculate Number of days
  
  ifelse(words == T, sprintf(text, D), D) # Message or just days
}
date.calculator(s = "1976-06-04", e = "2024-02-16") # Test
