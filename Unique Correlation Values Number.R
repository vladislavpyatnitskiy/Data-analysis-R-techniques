# Calculate umber of unique values for correlation or covariance
unique.values.number <- function(x){ 
  
  if (x < 2){ print("Please type any value bigger than 1") } else {
    
    x ^ 2 - sum(seq(x)) } # Calculate number
}
unique.values.number(32) # Test
