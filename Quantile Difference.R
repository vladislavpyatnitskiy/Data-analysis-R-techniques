quantile.diff <- function(x, y){ # Calculate Quantiles Difference
  
  if (is.null(ncol(x))) return(as.numeric(quantile(x, 1 - y)/quantile(x, y)))
    
  df <- NULL # For non-numeric types (Data Frames and Time Series)
  
  for (n in 1:ncol(x)){ # Calculate values for all columns
    
    df <- rbind(df, as.numeric(quantile(x[,n], 1 - y)/quantile(x[,n], y))) }
  
  colnames(df) <- "Ratio" # Column name
  rownames(df) <- colnames(x) # Row names
  
  df # Display for Data Frame, Time Series or Numeric
}
quantile.diff(as.numeric(state.income.df[,2]), .05) # Test
