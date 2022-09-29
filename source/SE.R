SE <- function(x) {
  if(!is.vector(x)){
    stop("Input needs to be a vector")
  }
  sd(x, na.rm = TRUE)/sqrt(sum(!is.na(x)))
  
}