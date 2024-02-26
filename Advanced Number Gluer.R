# Glue numbers from vector
number.gluer.pro <- function(x, negative = F, sign = NULL, left = T){ 
  
  df <- NULL # where to store all new variables
  
  for (m in 1:length(x)){ y <- x[[m]] # Transform each array
    
    if (any(y == ",") || any(y == ".")){ # If there are decimal values 
    
      if (any(y == ",")){ y[grep("[,]", as.character(y), "")] <- "." } # , to .
      
      d <- grep("[.]", as.character(y), "") # Find the order number of dot
      
      e2 <- seq((length(y) - d)) * -1 # exponent for digits after dot
      
      if (d == 1 || (d == 2 && y[1] == 0)){ # for numbers with only decimals
        
        N <- sum(as.numeric(y[seq(length(y), from = d + 1)]) * 10 ^ e2) }
      
      # exponent of digits before dot
      else { e1 <- sort(seq((d - 2), from = 0),decreasing = T)
      
      N <- sum(as.numeric(y[seq(d - 1)]) * 10 ^ e1) +
        sum(as.numeric(y[seq(length(y), from = d + 1)]) * 10 ^ e2) } }
    
    else { N <- sum(as.numeric(y[seq(length(y))]) * 10 ^ # otherwise
                      sort(seq((length(y) - 1), from = 0), decreasing = T)) }
    
    if (!is.null(sign) && isTRUE(left)){ N <- paste(sign, N, sep = "") } else {
      
      N <- paste(N, sign, sep = "") } # Add sign to the left or right
    
    if (isTRUE(negative)){ if (is.numeric(N)){ N <- -N } else { 
      
      N <- paste("-", N, sep = "") } } # Add minus (-) sign to value or number
  
  df <- c(df, N) } # Add new value to array
  
  df <- as.data.frame(df) # Change data type to data frame
  
  colnames(df) <- "Numbers" # Column name
  
  df # Display
}
number.gluer.pro(x = list(c(2, 3, 3, ",", 8, 7, 9), c(2, 3, 3), c(",", 8, 7, 9),
                       c(0, ",", 8, 7, 9)), negative=T,sign="$",left=T) # Test
