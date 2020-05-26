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