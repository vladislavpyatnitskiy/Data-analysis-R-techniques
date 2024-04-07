library("timeSeries") # Library

# Joining DFs into one when there are common observations in both time series
full.join.common <- function(x, y, col1, col2){
  
  df1 <- data.frame(rownames(x), x[,1]) # First Data Frame
  df2 <- data.frame(rownames(y), y[,1]) # Second Data Frame
  
  colnames(df1) <- c(col1, col2) # Similar Column names
  colnames(df2) <- c(col1, col2)
  
  df6 <- merge(df1, df2, by = col1, all = T) # Full Join
  
  l1 <- NULL # Observations only in first data frame
  l2 <- NULL # Observations only in second data frame
  l3 <- NULL # Common observations from both data frames
  
  for (n in 1:nrow(df6)){ # Reform into one column data frames
    
    if (is.na(df6[n,3])){ l1 <- rbind(l1, df6[n,1:2]) } 
    
    if (is.na(df6[n,2])){ l2 <- rbind(l2, cbind(df6[n,1], df6[n,3])) }
    
    if (isTRUE(df6[n,2]==df6[n,3])){ l3<-rbind(l3,cbind(df6[n,1],df6[n,2])) } }
  
  l4 <- list(l1, l2, l3) # Give data frames similar column names
  
  for (n in 1:length(l4)){ colnames(l4[[n]]) <- c(col1, col2) }
  
  df7 <- rbind.data.frame(l4[[1]], l4[[3]], l4[[2]]) # Join data frames
  
  df7 <- df7[apply(df7, 1, function(x) all(!is.na(x))),] # Get rid of NA
  
  ts <- as.Date(df7[,1]) # Put time series values into new column
  
  df7 <- as.data.frame(as.numeric(df7[,-1])) # Put other values into new column
  
  rownames(df7) <- ts # Make time series row names
  colnames(df7) <- col2 # Give column name
  
  as.timeSeries(df7) # Display United Data Frame
}
full.join.common(magn.data.test.df1, magn.data.test.df, "Date", "MAGN") # Test
