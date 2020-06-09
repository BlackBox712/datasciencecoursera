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

req_data <- fromJSON(toJSON(content(req)))
names(req_data)
subset(req_data, name == "datasharing", select = created_at)


#q2