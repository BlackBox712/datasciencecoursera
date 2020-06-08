#q1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./q1_datafile.csv")

q1_data <- read.csv("q1_datafile.csv")
sum(q1_data$VAL == 24, na.rm = TRUE)

#q2 (same dataset as q1)
