library(datasets)
data(iris)

#q1
round(tapply(iris$Sepal.Length, iris$Species == "virginica", mean))

#q2
apply(iris[,1:4], 2, mean)

library(datasets)
data(mtcars)

#q3
with(mtcars, tapply(mpg, cyl, mean))            #option1
sapply(split(mtcars$mpg, mtcars$cyl), mean)     #option2
tapply(mtcars$mpg, mtcars$cyl, mean)            #option3

#q4
round(mean(mtcars[mtcars$cyl == 8, ]$hp) - mean(mtcars[mtcars$cyl == 4, ]$hp))
