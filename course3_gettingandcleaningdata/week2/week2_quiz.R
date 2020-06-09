#q1
library(httr)
library(jsonlite)

oauth_endpoints("github")

myapp <- oauth_app("github", key = "7814f60231383cfe440d",
                   secret = "b2627660dc58483dd0441b71dea2ea533b427ee2")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)

q1_data <- fromJSON(toJSON(content(req)))
names(q1_data)
subset(q1_data, name == "datasharing", select = created_at)


#q2
library(sqldf)

fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl1, destfile = "./q2_datafile.csv")

acs <- read.csv("./q2_datafile.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")


#q3 (same dataset as q2)
unique(acs$AGEP)
sqldf("select distinct AGEP from acs")


#q4
library(XML)
library(httr)

fileUrl2 <- url("http://biostat.jhsph.edu/~jleek/contact.html")
q4_data <- readLines(fileUrl2)
close(fileUrl2)

c(nchar(q4_data[10]), nchar(q4_data[20]), nchar(q4_data[30]), nchar(q4_data[100]))


#q5
fileUrl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

q5_data <- read.fwf(fileUrl3, skip = 4, widths = c(12, 7, 4, 9, 4, 9, 4, 9, 4))

sum(q5_data[, 4])