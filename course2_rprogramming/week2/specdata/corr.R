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