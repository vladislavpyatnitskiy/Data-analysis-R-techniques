df.creator <- function(x){ l <- NULL # Define name for Data Frame

  l.names <- sapply(substitute(x),deparse)[-1] # Subtract names for columns
  
  for (n in 1:length(x)){ s <- x[[n]] # Each Data Frame
    
    if (is.null(l)){ l <- as.data.frame(s) } else { # Join to Data frame
      
      l <- merge(l, as.data.frame(s), by = "Date") } } # Merge with  columns
  
  rownames(l) <- l[,1] # Move Dates column to row names
  
  l <- l[,-1] # Reduce Dates column from main Data Frame
  
  l <- l[apply(l, 1,function(x) all(!is.na(x))),] # Reduce rows with na
  
  colnames(l) <- l.names # Give column names
  
  as.timeSeries(l) # Display
}
Nornickel.df <- df.creator(list(GMKN, Aluminium, Brent, Cattle, Copper, Gas,
                                Gold, Hogs, Nickel, Palladium, Platinum, Rice,
                                Silver, Soybeans, Sugar, USDRUB, Wheat, Zinc)) 
