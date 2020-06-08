#q1
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl1, destfile = "./q1_datafile.csv")

q1_data <- read.csv("q1_datafile.csv")
sum(q1_data$VAL == 24, na.rm = TRUE)

#q2 (same dataset as q1)
sum(is.na(q1_data$FES)) == 0

#q3
library("xlsx")

fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl2, destfile = "q3_datafile.xlsx")
