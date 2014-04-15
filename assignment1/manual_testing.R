spec1 <- read.csv("specdata/001.csv",header=T)
spec2 <- read.csv("specdata/002.csv",header=T)
spec3 <- read.csv("specdata/003.csv",header=T)
spec4 <- read.csv("specdata/004.csv",header=T)
spec5 <- read.csv("specdata/005.csv",header=T)
spec6 <- read.csv("specdata/006.csv",header=T)
spec7 <- read.csv("specdata/007.csv",header=T)
spec8 <- read.csv("specdata/008.csv",header=T)
spec9 <- read.csv("specdata/009.csv",header=T)
spec10 <- read.csv("specdata/010.csv",header=T)
spec70 <- read.csv("specdata/070.csv",header=T)
spec71 <- read.csv("specdata/071.csv",header=T)
spec72 <- read.csv("specdata/072.csv",header=T)
spec23 <- read.csv("specdata/023.csv",header=T)

spec1_10 <- rbind(spec1,spec2,spec3,spec4,spec5,spec6,spec7,spec8,spec9,spec10) 
rm(spec1,spec2,spec3,spec4,spec5,spec6,spec7,spec8,spec9,spec10)
head(spec1_10)

spec1_10_compl <- spec1_10[complete.cases(spec1_10[,2]),]
head(spec1_10_compl)

mean(spec1_10_compl[,2])
