con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode

library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en&oi=ao"
html <- htmlTreeParse(url, useInternalNodes = TRUE)

xpathSApply(html, "//title", xmlValue)
xpathSApply(html, "//td[@id='col-citedby']", xmlValue)

library(httr)
html2 <- GET(url)
content2 <- content(html2,as="text")
parsedHtml <- htmlParse(content2,asText=TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)

pg1 = GET("http://httpbin.org/basic-auth/user/passwd")
pg1

pg2 = GET("http://httpbin.org/basic-auth/user/passwd", authenticate("user","passwd"))
pg2

names(pg2)

google = handle("http://google.com")
pg1 = GET(handle=google,path="/")
pg2 = GET(handle=google,path="search")