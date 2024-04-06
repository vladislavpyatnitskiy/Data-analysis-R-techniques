number.gluer <- function(x){ # Glue separate numbers from vector
  
  sum(x[seq(length(x))] * 10 ^ (sort(seq(length(x)) - 1, decreasing = T)))
}
number.gluer(c(2, 3, 3)) # Test
