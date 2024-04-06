floorup <- function(x, d = 0){ # Function to round up to higher digit
  
  v = abs(x)  # For better negative values
  
  n <- grep("[.]", strsplit(as.character(v), "")[[1]]) # Chop value into digits
  
  l <- length(strsplit(as.character(v), "")[[1]]) # Count number of digits
  
  # Collect digits that were positioned before dot and make them numeric
  w <- as.numeric(strsplit(as.character(v), "")[[1]][1:(n - 1)])
  
  # Make whole number of these digits
  W <- sum(w[seq(length(w))] * 10 ^ (length(w) - seq(length(w))))
  
  if (d > 0){ # Ceiling up decimal digits
    
    # Collect digits that were after dot
    D <- as.numeric(strsplit(as.character(v), "")[[1]][(n + 1):l])
    
    # If value begins with 9 and d = 1 just add +1 to whole part, otherwise
    if (d == 1 && D[d] == 9){ O <- W + 1 } else {
      
      D <- D[-(d + 1):-length(D)] # Eliminate numbers after rounding
    
      D[d] <- D[d] + 1 # Add up 1 to number
      
      # Make whole number of these digits
      S <- sum(D[seq(length(D))] * 10 ^ (length(D) - seq(length(D)))) 
      
      # Join digits that were before dot with rounded value after dot
      O <- as.numeric(paste(W, S, sep = ".")) } } else if (d == 0){ 
        
      # Round first digit before dot or round other digits
      O <- W + 1 } else if (d < 0){ 
        
        D <- w[-(d + 1 + length(w)):-length(w)] # Delete digits to right
        
        D[length(D)] <- D[length(D)] + 1 # Add digit up
        
        # Glue up all digits into whole number
        O <- sum(D[seq(length(D))] * 10 ^
                   (sort((seq(length(w)) - 1),
                         decreasing = T)[-(d + 1 + length(w)):-length(w)])) }
  
  if (x < 0){ O = -O } # Return minus sign for negative value
  
  O # Display
}
floorup(-290.2324, d = -1) # Test
