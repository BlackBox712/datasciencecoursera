#q1
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl1, destfile = "./q1_datafile.csv")

q1_data <- read.csv("q1_datafile.csv")
sum(q1_data$VAL == 24, na.rm = TRUE)

#q2 (same dataset as q1)
sum(is.na(q1_data$FES)) == 0

#q3
library(openxlsx)

fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

dat <- read.xlsx (fileUrl2, rows = 18:23, cols = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

#q4
library(XML)

fileUrl3 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
q4_data <- xmlTreeParse(fileUrl3, useInternalNodes = TRUE)
rootNode <- xmlRoot(q4_data)

zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zipcodes == 21231)

#q5
fileUrl4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl4, destfile = "./q4_datafile.csv")