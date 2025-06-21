library(timeSeries) # Library

df.creator <- function(x){ # Bind Columns into Data Frame with Original Names
  
  l <- NULL 
  
  for (n in 1:length(x)){ s <- x[[n]] # Each Data Frame
  
    if (is.null(l)){ l <- as.data.frame(s) } # Join to Data frame
  
    else { l <- merge(l, as.data.frame(s), by = "Date") } } # Merge columns
    
  rownames(l) <- l[,1] # Move Dates column to row names
  
  l <- l[,-1] # Reduce Dates column from main Data Frame
  
  l <- l[apply(l, 1, function(x) all(!is.na(x))),] # Reduce rows with na
  
  colnames(l) <- sapply(substitute(x), deparse)[-1] # Give names to columns 
  
  as.timeSeries(l) # Display
}
df.creator(list(GMKN, Aluminium, Brent, Cattle, Copper, Gas,
                Gold, Hogs, Nickel, Palladium, Platinum, Rice,
                Silver, Soybeans, Sugar, USDRUB, Wheat, Zinc)) 
