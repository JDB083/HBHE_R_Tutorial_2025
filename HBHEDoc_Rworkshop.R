## R symbols ======================================================================================
# hashtag: comment

# can also do multiline comments using `#'`

#' this comment
#' spans
#' multiple lines
#' and I don't need to
#' type hash every time

# can also comment at the end of a line
1 # the number 1

# quote: character (vs. no quote, object)
"zero"
zero

# arrow: assign
one <- 1

# equals: also assign
two = 2

#' you can use either arrow or assign.
#' I prefer arrow, which is more conventional in R.
#' When we assign things, the output of what we assign does not appear in the console
#' (or wherever we're printing out). To see the output, we have to clal the object. Or we can wrap
#' the assignment call in parentheses.

check <- 1 + 1
check
(check2 <- 1 + 2)

# double equals: check equalness
1 == 1
1 == 2
one == 1
one == two

# exclamation point: not
1 != 2
1 != one

# we also have less than greater than etc.
1 < 1
1 <= 1
two > 1
two >= 2

# dollar sign-- get a column in a dataframe
mtcars$mpg

# and and or: logical operators
# AND is the ampersand &
# OR is the vertical bar (shift backslash) |
# and means all conditions must be satisfied to be true
# or means one condition must be satisfied to be true

TRUE & FALSE
TRUE | FALSE
TRUE & TRUE

# what will these return?
(1 == 1 & 1 == 2)

(1 == 1 | 1 == 2)

1 != 1

1 != 2

(1 == 1) != (1 == 2)

(1 == 1 | 1 == 2) & (2 == 2)

# there are other logical operators, like %in%
1 %in% c(1, 2, 3)
4 %in% c(1, 2, 3)

# colon (:), most often, to create a sequence
1:10

# tilde (~)-- usually for formulae
lm(mpg ~ cyl, data = mtcars)

## Packages =======================================================================================
install.packages("dplyr", "ggplot2", "tidyverse")
library(dplyr)

# alternatively, you can use the package pacman (package manager)
# or require
install.packages("pacman")
pacman::p_load(dplyr, ggplot2, tidyverse)
require(lubridate)

## Data types =====================================================================================
# basic data types --------------------------------------------------------------------------------
# character: text
# often called string in other languages
"one"
"1"
"hello, world"
typeof("1")

# numeric: numerical data, which means both 
# double: decimal number
1.2
typeof(1.2)

# integer: integer numbers. R will save all numbers as doubles unless told otherwise
as.integer(1)

# logical: TRUE or FALSE or NA
# often called boolean in other languages
TRUE
1 == 1
1 == 2
1 == "1"
1 == NA
NA

# data type operations ----------------------------------------------------------------------------
# checking data.types: typeof()
# numerics (doubles)
typeof(1)
typeof(1.2)

# characters
typeof("hello, world")
typeof("1")

# logicals
typeof(TRUE)
typeof(1 == 1)
typeof(NA)
is.na(NA)

typeof(NULL)

# casting data
as.character(1)
as.numeric("1.2")
as.logical(0)
as.logical(1)

# putting things together ---------------------------------------------------------------------------
# an object is anything in R
mtcars
View(mtcars)
1
one

# a vector is a list of objects with the same type
# we combine these data using c() aka concatenate
vector1 <- c(1, 2, 3)
vector1
vector2 <- c("one", "two", "three")

# what happens if we try to combine objects with different types?
vector3 <- c(1, "two", 3)
vector3
vector4 <- c(1, TRUE, 3)
vector4

# this is why we need to make sure we always print things!

# we can "index" into vectors using brackets
vector1
vector1[2]

# a list is a list of things with different types
# we combine these data using list()
list1 <- list(1, 2, 3)
list2 <- list(1, "two", 3)
list3 <- list(1, TRUE, 3)

# and we can index into lists!
list1[[2]]
list1[2]

# you can even make a list of lists or a list of vectors!
list4 <- list(vector1, vector2, vector3)
list4
list5 <- list(vector1, list2, vector2)

list4[[1]][2]

# a dataframe represents tabular data
mtcars
mtcars$mpg

# you can create a data.frame using data.frame
# the columns in the dataframe can't be lists, they must all have the same data type
labels_vector <- c("one", "two", "three")
values_vector <- c(1, 2, 3)
testdf <- data.frame(labels = labels_vector, values = values_vector)
print(testdf)

# notice that the columns are named. We can access them with the dollar sign now
testdf$labels # this basically returns our vector
testdf$labels[2]

# or we can index the same way (with the brackets, but we have two dimensions now-- row and column)
testdf[1, 2] # row 1, column 2 of testdf
testdf[1, "values"]

# tabular data that is all of one type can be represented in a matrix
testmatrix <- matrix(data = c(1,2,3,4), nrow = 2, ncol = 2)
testmatrix

# some packages will have their own object types for tabular data, e.g. data.table
require(data.table)
testdt <- data.table(labels = labels_vector, values = values_vector)
testdf
testdt

# Functions =======================================================================================
#' A function is like an operation that takes in information and returns a value. The function acts
#' on an "argument". Functions can take multiple arguments. The arguments are sometimes named, so
#' we'll have something like function(arg1 = arg1value, arg2 = arg2value)

# Example: print, mean
print(vector1)
mean(vector1)
mean(c(1, 2, 3, NA))
mean(c(1, 2, 3, NA), na.rm = TRUE)

# we can get more information about functions using this command: ?function
?mean
?pnorm
# we can also Google them, which I would highly encourage

# Example: pnorm. Nested functions
quants <- seq(-1, 1, 0.1)
dnorm(quants, mean = 0, sd = 1)
plot(dnorm(quants, mean = 0, sd = 1))

pnorm(qnorm(0.4))

# we can also create our own functions
sayhi <- function(name){
  print(paste("Hello, ", name))
}

sayhi(name = "Jessica")

add1 <- function(number){
  return(number + 1)
}

add1(number = 2)
testfunction <- add1(2)

## Downloading and manipulating data ===============================================================================
# setwd()
getwd()
gva_data <- read.csv("export-31415fd9-bb11-4d77-b505-bba139481462.csv")
nrow(gva_data)
ncol(gva_data)
head(gva_data)
View(gva_data)
summary(gva_data)
colnames(gva_data)

gva_mi <- gva_data[gva_data$State == "Michigan",]
gva_data$State == "Michigan"

mean(gva_data$Victims.Injured)
sort(gva_data$Victims.Killed)

# we can make changes to our data and write it back out
gva_data$Total.Killed <- gva_data$Victims.Killed + gva_data$Suspects.Killed
write.csv(gva_data, "gva_data_modified.csv")

# try it yourself. First, let's get the year. This is complicated, so I'll give it to you
gva_data$date <- as.Date(gva_data$Incident.Date, format = "%B %d, %Y")
gva_data$year <- year(gva_data$date)

# how many shootings in 2024 had one or more victims killed? ======================================
# nrow(gva_data[gva_data$year == 2024 & gva_data$Victims.Killed >= 1,])
# my answer: 291



# plotting data ===================================================================================
hist(mtcars$mpg)
boxplot(mtcars$mpg)
plot(x = mtcars$mpg, y = mtcars$cyl)

require(ggplot2)
test_gg <- ggplot(data = mtcars, aes(x = wt, y = mpg)) +
         geom_point()
test_gg

test_gg_fancier <- ggplot(data = mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  geom_line() +
  theme_minimal() +
  labs(x = "Weight",
       y = "Miles per Gallon",
       color = "Cylinders",
       title = "Car Weight vs Miles per Gallon")
test_gg_fancier

# loops: if, while, for ===========================================================================
# if = if a condition is TRUE
if(1 == 1) print("all is right in the world!")
if(1 != 1) print("is math even real?")

# here's a coin flip!
if(rnorm(1) < 0){
  print("under")
} else {
  print("over")
}

# aside: what are we sampling from? this distribution!
norm_10000 <- rnorm(1000, mean = 0, sd = 1)
hist(norm_10000)

# while = until true
# Example: Generating random numbers until a value exceeds 0.9
x <- 0
while (x < 0.9) {
  x <- runif(1) # Generate a random uniform number
  print(x)
}

# for = iterate over a list
for(i in c(1:10)){
  print(i)
}

for(x in c("Jessica", "Lily", "Odalys")){
  print(paste0(x, " loves R!"))
}

# for loops can help us iterate over every row in a dataset
# loops can nest
gva_data$any_suspects_arrested <- NA
for(i in 1:nrow(gva_data)){
  suspects_arrested_i <- gva_data[i, "Suspects.Arrested"]
  if(suspects_arrested_i > 0){
    gva_data[i, "any_suspects_arrested"] <- TRUE
  } else{
    gva_data[i, "any_suspects_arrested"] <- FALSE
  }
}
View(gva_data[, c("Suspects.Arrested", "any_suspects_arrested")])