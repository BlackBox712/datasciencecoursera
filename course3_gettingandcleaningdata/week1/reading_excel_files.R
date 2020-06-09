fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./cameras.xlsx")
dateDownloaded <- date()

library(openxlsx)
cameraData <- read.xlsx("./cameras.xlsx")
head(cameraData)

colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <- read.xlsx("./cameras.xlsx", cols = colIndex,rows = rowIndex)
cameraDataSubset