# creating variables
y <- 10^2
a <- "predictive analytics"
z <- 10.26
print(z)
# vectors
myVector <- c(1,2,3,4,5)
print(myVector)
print(myVector[4])
foo <- 20
bar <- 50
myNewVec <- c(foo, bar)
myOtherVec <- seq(from=3, to=27, by=3)
myOtherNewVec <- rep(x=2, times=10)
lim <- -11
mySeq <- seq(5, -11, -0.3)
print(mySeq)
myTestVec = c(-1.3, -5,7,-9)
myTestVec2 = c(rep(-1.3, times=10), rep(-5, times=10), rep(7, times=10), rep(-9, times=10))
print(myTestVec2)
myTestVec3 = c(myTestVec2, myTestVec2)
print(myTestVec3)
sort(myTestVec3, decreasing=TRUE)
repVector <- sort(rep(c(-1,3,-5,7,-9), each=10, times=2), decreasing = TRUE)
print(repVector)

#matrices
#myMatrix <- matrix(vector, no_of_rows, no_of_columns)
myMatrix <- matrix(c(1,2,3,4,5,6,7,8,9), nrow=3)
print(myMatrix)
#accessing a matrix element
print(myMatrix[2,2]) #test

myVector <- c(2,2,2,2,2,2,2,2,2) # rep(x=2, times=9)
myMatrixx <- matrix(myVector, ncol=3)
print(myMatrixx)

# lists
foo <- list(2.2, "predictive analytics", TRUE, 
            matrix(c(10,20,30,40), nrow = 2, ncol = 2), "hello")
print(foo)
print(foo[4])

#assigning names
names(foo) <- c("integer", "string", "logical", "matrix", "string2")
print(foo$string2)

#dataframes
myData <- data.frame(
  person = c("Bob", "Ryan", "Julia"),
  age = c(31, 102, 25),
  sex = factor(c("M", "M", "F"))
)
myData$person

newRecord <- data.frame (
  person = "Sarah",
  age = 7,
  sex = "F"
)

myData <- rbind(myData, newRecord)

funny <- factor(c("High", "Low", "Medium", "Medium"))
myData <- cbind(myData, funny)
