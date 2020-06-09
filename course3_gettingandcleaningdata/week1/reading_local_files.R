fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "cameras.csv")
dateDownloaded <- date()

cameraData <- read.table("./cameras.csv", sep = ",", header = TRUE)
head(cameraData)

cameraData <- read.csv("./cameras.csv")
head(cameraData)