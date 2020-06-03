best <- function(state, outcome)
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
        row_index <- which.min(as.numeric(state_data[, col_index]))
    )
    
    hospitals <- state_data[row_index, 2]
    hospitals <- sort(hospitals)
    hospitals[1]
    
}