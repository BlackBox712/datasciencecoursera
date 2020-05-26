#pollutantmean function (part 1)
pollutantmean <- function(directory, pollutant, id = 1:332)
{
    all_files <- list.files(path = directory, full.names = TRUE)
    file_data <- data.frame()
    
    for (i in id) 
    {
        file_data <- rbind(file_data, read.csv(all_files[i]))
    }
    
    mean(file_data[, pollutant], na.rm = TRUE)
}

#complete function (part 2)
complete <- function(directory, id = 1:332)
{
    all_files <- list.files(path = directory, full.names = TRUE)
    file_data <- data.frame()
    
    nobs <- data.frame()
    
    for (i in id) 
    {
        file_data <- read.csv(all_files[i])
        
        file_nobs <- sum(complete.cases(file_data))
        nobs_row <- data.frame(i, file_nobs)
        nobs <- rbind(nobs, nobs_row)
    }
    
    colnames(nobs) <- c("id", "nobs")
    
    nobs
}

#corr function (part 3)
corr <- function(directory, threshold = 0)
{
    all_files <- list.files(path = directory, full.names = TRUE)
    file_data <- data.frame()
    
    corrs <- numeric()
    
    for (i in 1:332) 
    {
        file_data <- read.csv(all_files[i])
        
        if (sum(complete.cases(file_data)) > threshold)
        {
            temp <- file_data[!is.na(file_data$sulfate), ]
            file_nobs <- temp[!is.na(temp$nitrate), ]
            
            file_corr <- cor(file_nobs$sulfate, file_nobs$nitrate)
            
            corrs <- c(corrs, file_corr)
        }
    }
    
    corrs
}


#quiz

#q1
pollutantmean("specdata", "sulfate", 1:10)

#q2
pollutantmean("specdata", "nitrate", 70:72)

#q3
pollutantmean("specdata", "sulfate", 34)

#q4
pollutantmean("specdata", "nitrate")

#q5
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

#q6
cc <- complete("specdata", 54)
print(cc$nobs)

#q7
RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

#q8
cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

#q9
cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

#q10
cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
