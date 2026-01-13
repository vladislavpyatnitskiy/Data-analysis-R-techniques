date.comp.calculator <- function(s, e, x, beginning = T, text = T){
  
  if (s > e) return(message("End date cannot be earlier than Start date"))
  
  D <- as.numeric(as.Date(e) - as.Date(s)) # Calculate Number of days
  
  if (beginning){ p = as.Date(x) + D } else { p = as.Date(x) - D }
  
  if (text){ # display text
    
    s_t = sprintf(
      "%s %s %s as between %s and %s, it should last to %s",
      "If something happenned in", x, "has the same duration", s, e, p
    )
    
    e_t = sprintf(
      "%s %s %s as between %s and %s, it should have been started in %s",
      "If something ended in", x, "has the same duration", s, e, p
    )
    
    return(
      ifelse(
        beginning == T,
        s_t,
        e_t
        )
      )
  }
  p # display date only
}
date.comp.calculator("1971-07-12", "1971-12-29", "2015-08-09", T)
