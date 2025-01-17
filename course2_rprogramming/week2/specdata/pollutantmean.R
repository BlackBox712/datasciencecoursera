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