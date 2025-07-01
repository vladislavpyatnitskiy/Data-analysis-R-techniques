# Calculate umber of unique values for correlation or covariance
unique.values.number <- function(x){ 
  
  if (x < 2) return("Please type any value bigger than 1") 
    
  x ^ 2 - sum(seq(x)) # Calculate number
}
unique.values.number(32) # Test
