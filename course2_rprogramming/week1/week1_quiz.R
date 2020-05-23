#q4
x <- 4L
class(x)

#q5
x <- c(4, TRUE)
class(x)

#q6
x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x, y)

#q8
x <- list(2, "a", "b", TRUE)  
x[[2]]  
class(x[[2]])

#q9
x <- 1:4
y <- 2:3
x+y
class(x+y)

#q10
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x > 10] <- 4
x
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x >= 11] <- 4
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