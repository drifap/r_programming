corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  ## notum complete.r til þess að finna ut nobs fyrir threshold svo þurfum við að 
  ## gera correlation 

  source("complete.R")
  com  <-  complete(directory) # complete function inniheldur bæði directory og id 
                             # með þvi að hafa bara directory her erum við að nota id 
                             # default sem þyðir allir frá 1 til 332
  
  com2  <-  subset(com,com$nobs>threshold)
  
  ## bua til corr function
   temp <- data.frame(row.names=c("id","nobs","sulf","nitr"))
  
  for (i in seq_along(com2)){
    while (nchar(com2$id[i]) < 3){                             # if id is less then 3 digits
      com2$id[i] <- paste("0",com2$id[i],sep="")
    }  
    
    file <- paste(directory,"/", com2$id[i], ".csv", sep = "")
    b <- read.csv(file)
    pol1 <- as.numeric(b[,2])
    pol2<- as.numeric(b[,3])
    pol1 <- na.omit(pol1)
    pol2 <- na.omit(pol2)
    
    rows <- c(com2$id[i],nrow(na.omit(b[,2])),nrow(na.omit(b[,3])))
    temp <- rbind(temp,rows)
    
  }

  ## búa til data frame sem nær í id - nobs fyrir sulfate - nobs fyrir nitrate
  ## það á einhvernvegin að nota complete.R 
  print(temp)
  #cor(temp[,3], temp[,4], use = "complete.obs")
}