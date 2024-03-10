roundup <- function(x, y = trunc, to5 = T){ # Round options 

  if (isTRUE(to5)){ # When round to 5 value needed
    
    trunc(round(x) / 10 ^ (nchar(round(x)) - 1)) * 10 ^ (nchar(round(x)) - 1) +
      5 * 10 ^ (nchar(x) - 2)
    
  } else { # When you need to round up to lower or higher number
  
    y(round(x) / 10 ^ (nchar(round(x)) - 1)) * 10 ^ (nchar(round(x)) - 1) }
}
roundup(501, y = trunc, to5 = T) # Test
