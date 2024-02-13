df.rus.maker1 <- function(x){ l <- NULL # Define name for Data Frame

  l.names <- sapply(substitute(x),deparse)[-1] # Subtract names for columns

  for (n in 1:length(x)){ s <- x[[n]] # Each Data Frame
    
    if (is.null(l)){ l <- as.data.frame(s) # Join to Data frame
      
      colnames(l)[2] <- l.names[n] } else { v <- as.data.frame(s)
        
        colnames(v)[2] <- l.names[n]  # Give name
        
        l <- merge(l, v, by = "Date") } } # Merge with other columns
  
  rownames(l) <- l[,1] # Assign Dates as row names
  
  l <- l[,-1] # Reduce Dates column
  
  l # Display
}
Nornickel.df <-df.rus.maker1(list(GMKN, Aluminium, Brent, Cattle, Copper, Gas,
                                  Gold, Hogs, Nickel, Palladium, Platinum,
                                  Rice, Silver, Soybeans, Sugar, USDRUB, Wheat,
                                  Zinc)) # Test
