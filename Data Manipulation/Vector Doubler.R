vector.doubler <- function(x){ # Transform vector into two column data frame
  
  l <- NULL # Store values
  
  for (n in 1:length(x)){ while (x[n] != x[length(x)]){ # Add values
    
      l <- rbind.data.frame(l, cbind(x[n], x[n + 1])) # Till last number
    
    break } } # Stop when cycle is over
  
  l # Display
}
vector.doubler(x = c(1, 58, 94, 121, 145, 190, 211, 244, 279)) # Test
