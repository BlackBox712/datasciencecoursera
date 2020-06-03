rankhospital <- function(state, outcome, num = "best")
{
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    if(!state %in% unique(data[["State"]]))
    {
        stop("invalid state")
    }
    
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
    
    state_data <- subset(data, State == state)
    suppressWarnings(
        state_data[, col_index] <- as.numeric(state_data[, col_index])
    )
    
    ordered_data <- state_data[order(state_data[,col_index], state_data[, 2]), ]
    ordered_data <- ordered_data[(!is.na(ordered_data[ ,col_index])),]
    
    if(num == "best")
    {
        num <- 1
    }
    else if(num == "worst")
    {
        num <- nrow(ordered_data)
    }
    
    ordered_data[num, 2]
}