time.pace <- function(x, y, e = F){ # Period when growing values converge
  
  if (y[1] == y[2] || y[1] <= y[2]){ print("Convergence will not happen") }
  
  else { if (isFALSE(e)){ log(x[1]/x[2]) / log((1 + y[2])/(1 + y[1])) } else {
    
      log(x[1]/x[2]) / -(y[1]-y[2]) } } # Choice between discrete & continuous
}
time.pace(c(20, 1000), c(0.1, 0.1), e = T) # Test
