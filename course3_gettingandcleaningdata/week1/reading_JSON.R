library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)

jsonData$name

names(jsonData$owner)
jsonData$owner$login

myjson <- toJSON(iris, pretty=TRUE)
cat(myjson)
