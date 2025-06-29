date.calculator <- function(s = NULL, e = NULL, words = T,
                            text = "Time period is %s days"){
  
  D <- as.numeric(as.Date(e) - as.Date(s)) # Calculate Number of days
  
  ifelse(words == T, sprintf(text, D), D) # Message or just days
}
date.calculator(s = "1976-06-04", e = "2024-02-16") # Test
