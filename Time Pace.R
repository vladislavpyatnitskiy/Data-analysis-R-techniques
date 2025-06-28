time.pace <- function(x, y, e = F){ # Period when growing values converge
  
  if (y[1] == y[2] || y[1] <= y[2]){ return("Convergence will not happen") }
  
  if (e){ log(x[1] / x[2]) / -(y[1] - y[2]) } # Discrete or Continuous
  
  else { log(x[1] / x[2]) / log((1 + y[2]) / (1 + y[1])) }
}
time.pace(c(20, 1000), c(0.1, 0.1), e = T) # Test
