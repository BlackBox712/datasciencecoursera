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
    
    nobs
}

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