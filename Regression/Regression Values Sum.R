reg.sum.for.df <- function(x, y = NULL){ # Sum of regression coefficients
  
  r <- summary(lm(x[,1] ~ x[,seq(ncol(x), from = 2)], x)) # run regression
  
  if (is.null(y)){ # if Date is not defined, show last observation
    
    r <- r$coefficient[1] + sum(crossprod(x[nrow(x),][seq(ncol(x), from = 2)],
                                          r$coefficient[seq(ncol(x),
                                                            from =2)]))
    
  } else { r <- r$coefficient[1] + sum(crossprod(x[y,][seq(ncol(x),
                                                           from = 2)],
                                                 r$coefficient[seq(ncol(x),
                                                                   from=2)])) }
  
  names(r) <- colnames(x)[1] # Give name to number
  
  r # Display
}
reg.sum.for.df(Nornickel.df) # Test
