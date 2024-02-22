rounddown <- function(x, d = 1){ # Round down negative integers
 
  # Break number into separate digits
  L1 <- as.numeric(strsplit(as.character(x),"")[[1]][2:nchar(x)])
  L2 <- L1[-nchar(x) + seq(d)] # Reduce last digit
  L2[length(L2)] <- L2[length(L2)] + 1 # Round
  
  # Sum up digits to get rounded number
  (sum(L2[seq(length(L2))] * 10^(length(L2) - seq(length(L2)))) * 10^d) * -1
}
rounddown(-132222, d = 2) # Test
