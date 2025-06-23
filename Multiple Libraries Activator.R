libs <- function(x){ # Activate Multiple Libraries with one function
  
  lapply(x, require, character.only = T) # Libs
}
libs(c("rvest", "httr", "xml2"))
