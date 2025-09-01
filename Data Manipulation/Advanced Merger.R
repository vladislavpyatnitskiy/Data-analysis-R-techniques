df.merger <- function(x, by, all=F){
  
  if (length(x) < 2) return(message("There should be 2 columns at least"))
  
  if (is.data.frame(x)) return(message("Input should be a list"))
  
  df <- x[[1]]
  
  for (n in 1:(length(x) - 1)) df <- merge(df, x[[n + 1]], by=by, all=all)
  
  df
}
df.merger(list(life.ru.df, rus.bubble.df.new, fer.df.dif), by = "Region")
