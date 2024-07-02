data.transformation.ggplot <- function(x){ # Format data for ggplot2 plots
  
  I <- NULL # Group tickers, indices or portfolio names
  
  for (n in 2:(length(colnames(x)))){ I <- rbind(I, colnames(x)[n]) }
  
  R <- NULL # Group returns
  d <- NULL # Format Dates column
  
  for (m in 1:nrow(x)){ # Join Returns in first loop and dates in second one
    
    for (n in 2:length(colnames(x))){ R <- rbind(R, x[m,n] * 100) } 
    
    for (n in 1:(ncol(x) - 1)){ d <- rbind(d, x[m,1]) } } 
  
  D <- data.frame(d, I, R) # Join all 3 columns: Dates, Indices and Returns
  
  colnames(D) <- c("Date", "Series", "Return") # Column names
  
  D # Display Data Frame
}
data.transformation.ggplot(test.plt.comp)
