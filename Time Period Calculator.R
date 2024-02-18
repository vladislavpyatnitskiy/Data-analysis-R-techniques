date.calculator <- function(s = NULL, e = NULL, words = T,
                            script = "Time period is %s days"){
  
  if (isTRUE(words)){ # Make string with text; add %s for number 
    
    sprintf(script, as.numeric(as.Date(e) - as.Date(s))) } else {
      
      as.numeric(as.Date(e) - as.Date(s)) } # Show number as numeric
}
date.calculator(s = "1976-06-04", e = "2024-02-16") # Test
