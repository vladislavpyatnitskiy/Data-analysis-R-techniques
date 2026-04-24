order_df <- function(x, y, decreasing = F){ # Order within column
  
  x[order(x[[y]], decreasing = decreasing),]

}
order_df(x=sm_data5, y="DEBT/EBITDA")
