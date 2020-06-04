rankall <- function(outcome, num = "best")
{
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    if(outcome == "heart attack")
    {
        col_index <- 11
    }
    else if(outcome == "heart failure")
    {
        col_index <- 17
    }
    else if(outcome == "pneumonia")
    {
        col_index <- 23
    }
    else
    {
        stop("invalid outcome")
    }
    
    states_list <- sort(unique(data$State))
    
    suppressWarnings(
        data[, col_index] <- as.numeric(data[, col_index])
    )
    
    data <- data[, c(2, 7, col_index)]
    
    if(num == "best")
    {
        temp_num <- 1
    }
    else if(num != "worst")
    {
        temp_num <- num
    }
    
    rank_list <- data.frame()
    
    for(i in seq_along(states_list))
    {
        state_data <- subset(data, State == states_list[i])
        
        ordered_data <- state_data[order(state_data[,3], state_data[, 2]), ]
        ordered_data <- ordered_data[(!is.na(ordered_data[ ,3])), ]
        
        if(num == "worst")
        {
            temp_num <- nrow(ordered_data)
        }
        
        rank_row<- cbind(ordered_data[temp_num, 1], states_list[i])
        rank_list <- rbind(rank_list, rank_row)
    }
    
    rank_list <- rank_list[, 1:2]
    names(rank_list) <- c("hospital", "state")
    rank_list
}