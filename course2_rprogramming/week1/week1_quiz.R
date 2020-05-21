#q4
x <- 4
class(x)

#q5
x <- c(4, "a", TRUE)
class(x)

#q6
x <- c(1,3, 5)
y <- c(3, 2, 10)
cbind(x, y)

#q8
x <- list(2, "a", "b", TRUE)
x[[1]]
class(x[[1]])

#q9
x <- 1:4
y <- 2:3
x+y
class(x+y)

#q10
x <- c(3, 5, 1, 10, 12, 6)
x[x <= 5] <- 0
x
x <- c(3, 5, 1, 10, 12, 6)
x[x < 6] <- 0
x

#q11-q20
hw1 <- read.csv("course2_rprogramming/week1/hw1_data.csv")

#q11
names(hw1)

#q12
hw1[c(1,2),]

#q13
nrow(hw1)

#q14
tail(hw1, 2)

#q15
hw1[47,]

#q16
values <- subset(hw1, is.na(Ozone))
nrow(values)

#q17
values <- subset(hw1, !is.na(Ozone), select = Ozone)
apply(values, 2, mean)

#q18
values <- subset(hw1, Ozone > 31 & Temp > 90, select = Solar.R)
apply(values, 2, mean)

#q19
values <- subset(hw1, Month == 6, select = Temp)
apply(values, 2, mean)

#q20
values <- subset(hw1, Month == 5 & !is.na(Ozone), select = Ozone)
apply(values, 2, max)