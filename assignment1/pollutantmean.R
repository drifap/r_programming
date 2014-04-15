pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  

  y <- NULL
  
  for (i in 1:length(id)){
    while (nchar(id[i]) < 3){                             # if id is less then 3 digits
      id[i] <- paste("0",id[i],sep="")
    }  
    
    file <- paste(directory,"/", id[i], ".csv", sep = "")
    b <- read.csv(file)
    pol <- as.numeric(b[[pollutant]])
    pol <- na.omit(pol)
    y <- append(y,pol)
  }

  mean(y)
  
}
