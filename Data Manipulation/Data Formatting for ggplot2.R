data.transformation.ggplot <- function(x){ # Format data for ggplot2 plots
  
  df0 <- NULL # Format Dates column
  
  for (m in 1:nrow(x)){ for (n in 1:(ncol(x)-1)){ df0 <- rbind(df0, x[m,1]) } }
  
  df11 <- NULL # Group tickers, indices or portfolio names
  
  for (m in 1:nrow(x)){ df1 <- NULL # Create column with 
    
    for (n in 2:(length(colnames(x)))){ # Collect all but the first one
      
      df1 <- rbind(df1, colnames(x)[n]) } # Collect all names from columns
    
    df11 <- rbind(df11, df1) } # Join repeating names of tickers and indices
  
  df22 <- NULL # Group returns
  
  for (m in 1:nrow(x)){ df2 <- NULL # Take value from each row from 2nd column 
    
    for (n in 2:length(colnames(x))){ df2 <- rbind(df2, x[m,n] * 100) }
    
    df22 <- rbind(df22, df2) } # Join return values 
  
  df.final <- data.frame(df0, df11, df22) # Join all 3 columns
  
  colnames(df.final) <- c("Date", "Series", "Return") # Column names
  
  df.final # Display Data Frame
}
data.transformation.ggplot(test.plt.comp) # Test
