compound.percentage.diff <- function(x, y=NULL, exp=F){ # Compounding Effect
  
  if (is.null(y)){ y <- c(1, 10, 100, 1000, 10000) } # Time Periods
  
  D <- NULL # Store values
  
  for (n in 1:length(y)){ # Calculate via discrete or continuous way
    
    if (exp){ D <- rbind(D,cbind(exp(x * y[n]), exp(-x * y[n]))) }
    
    else { D <- rbind(D, cbind((1 + x) ^ y[n], (1 - x) ^ y[n])) } }
    
  # Assign column names as percentages and row names as time periods
  colnames(D) <- c(sprintf("+ %s %%", x * 100), sprintf("- %s %%", x * 100))
  rownames(D) <- y 
  
  round(D, 8) # Display
}
compound.percentage.diff(0.001, exp = F) # Test
