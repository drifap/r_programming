test <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

  make_id <- id
  
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

    #sub <- data.frame(subset(b[,make_pol]))
#     rows
#     data1 <- rbind(data1, b[,make_pol])  
  }

  

  mean(y)
  
}

