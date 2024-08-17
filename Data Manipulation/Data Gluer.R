lapply(c("quantmod", "timeSeries"), require, character.only = T) # Libraries

df.gluer <- function(x){ # Glue data from Yahoo and CSV file
  
  R <- as.character(read.fwf(textConnection(x), widths = c(25, 29),
                             colClasses="character")[2])
  
  R <- read.fwf(textConnection(R), widths=c(4, 8), colClasses="character")[1]
  
  C <- read.csv(x)[,c(3,8)] # Read CSV
  
  C[,1] <- format(strptime(C[,1], format = "%y%m%d"), "%Y-%m-%d")
  
  d <- C[,1]
  C <- as.data.frame(C[,-1])
  rownames(C) <- d
  colnames(C) <- R
  
  S <- prices.yahoo(sprintf("%s%s", R, ".ME")) # Data from Yahoo
  
  df1 <- data.frame(rownames(S), S[,1]) # First Data Frame
  df2 <- data.frame(rownames(C), C[,1]) # Second Data Frame
  
  colnames(df1) <- c("Date", R) # Similar Column names
  colnames(df2) <- c("Date", R)
  
  df6 <- merge(df1, df2, by = "Date", all = T) # Full Join
  
  l1 <- NULL # Observations only in first data frame
  l2 <- NULL # Observations only in second data frame
  l3 <- NULL # Common observations from both data frames
  
  for (n in 1:nrow(df6)){ # Reform into one column data frames
    
    if (is.na(df6[n,3])){ l1 <- rbind(l1, cbind(df6[n,1], df6[n,2])) } 
    
    if (is.na(df6[n,2])){ l2 <- rbind(l2, cbind(df6[n,1], df6[n,3])) }
    
    if (!is.na(df6[n,2]) && !is.na(df6[n,3])){
      
      l3<-rbind(l3,cbind(df6[n,1],df6[n,2])) } }
  
  l4 <- list(l1, l2, l3) # Give data frames similar column names
  
  for (n in 1:length(l4)){ colnames(l4[[n]]) <- c("Date", R) }
  
  df7 <- rbind.data.frame(l4[[1]], l4[[3]], l4[[2]]) # Join data frames
  df7 <- df7[order(df7[,1]),]
  df7 <- df7[apply(df7, 1, function(x) all(!is.na(x))),] # Get rid of NA
  
  ts <- as.Date(df7[,1]) # Put time series values into new column
  
  df7 <- as.data.frame(as.numeric(df7[,-1])) # Put other values into new column
  
  rownames(df7) <- ts # Make time series row names
  colnames(df7) <- R # Give column name
  
  as.timeSeries(df7) # Display United Data Frame
}
df.gluer("~/Desktop/Family Account/LSRG_220101_240815.csv") # Test
