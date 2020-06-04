#q1
best("SC", "heart attack")

#q2
best("NY", "pneumonia")

#q3
best("AK", "pneumonia")

#q4
rankhospital("NC", "heart attack", "worst")

#q5
rankhospital("WA", "heart attack", 7)

#q6
rankhospital("TX", "pneumonia", 10)

#q7
rankhospital("NY", "heart attack", 7)

#q8
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)
