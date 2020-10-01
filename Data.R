##################
# ACCESSING DATA #
##################

### DATA TYPES #################################################
## Numeric
n1 <- 10
n2 <- 1.5

## Character
c1 <- "text"

## Logical
l1 <- TRUE
l2 <- F

typeof(n1)


### DATA ESTRUCTURES #################################################
## VECTOR
v1 <- c(1,2,3,4,5)
v2 <- c("1","2","3")
v3 <- c(TRUE, FALSE, FALSE)
is.vector(v1)

## MATRIX
m1 <- matrix (c(T,T,F,F,T,F), nrow = 2)
m2 <- matrix (c("a","b","c","d"), nrow = 2, byrow = T)
m2

## ARRAY
# Give data, then dimensions(rows, cols, tables)
a1 <- array(c(1:24), c(4,3,2)) # 3 dimensions
a1

## DATA FRAME
# Can combine vectors of the same length
vNum <- c(1,2,3)
vChar <- c("a","b","c")
vLog <- c(T,F,T)
dfa <- cbind(vNum, vChar, vLog) # Matrix
df <- as.data.frame(cbind(vNum, vChar, vLog)) # DF
df

## LIST
o1 <- c(1,2,3,4,5)
o2 <- c("1","2","3")
o3 <- c(TRUE, FALSE, FALSE)
list1 <- list(o1, o2, o3)
list2 <- list(o1, o2, o3, list2)

##COERCING TYPES 
# We can coerce the data in different types to serve for different purposes

# Automatic coercion - Goes to "least restrictive" data type
(coerce1 <- c(1,"b", TRUE))
typeof(coerce1)

# Coerce numeric to integer
(coerce2 <- 5) # Float
(coerce3 <- as.integer(5)) #Int

# Coerce Character to numeric
(coerce4 <- c("1","2", "3")) # Char
(coerce5 <- as.numeric(c("1","2","3"))) # Num

# Coerce matrix to DF
(coerce6 <- matrix(1:9,nrow=3))
is.matrix(coerce6)
(coerce7 <- as.data.frame(matrix(1:9,nrow=3)))
is.data.frame(coerce7)

## FACTORS 
# Factor take on a limited number of different values( categorical variables )
# with categories and names of tose categories
# An attribute of a vector that specifies the possible values and their order
# Categorical Variable: Value is limited and usually based on a particular finite group (gender, year)
# Continuous variable: Can take any value. (price, revenue)
# e.g. weather("rainy", "sunny") to (0,1)

# Create data
(x1 <- 1:3)
(y <- 1:9)
(df1 <- cbind.data.frame(x1,y))
df1
typeof(df1)
str(df1)

## AS.FACTOR
(x2 <- as.factor(c(1:3)))
(df2 <- cbind.data.frame(x2, y))
typeof(df2)

# Define existing variable as factor
x3 <- c(1:3)
df3 <- cbind.data.frame(x3, y)
(df3$x3 <- factor(df3$x3,
                  levels = c(1,2,3)))
typeof(df3)
df3

# labels for factor
x4 <- c(1:3)
df4 <- cbind.data.frame(x4, y)
(df4$x4 <- factor(df4$x4,
                  levels = c(1,2,3),
                  labels = c("Mac","Win","Linux")))
typeof(df4$x4)
df4

# ordered factors and labels
x5 <- c(1:3)
df5 <- cbind.data.frame(x5, y)
(df5$x5 <- ordered(df5$x5,
                  levels = c(3,1,2),
                  labels = c("Mac","Win","Linux")))
typeof(df5$x5)
df5


### ENTERING DATA ###########################################################################
# Ad-Hoc data
# colon, seq, c, scan, rep

# Assigns number 0 to 10
x1 <- 0:10
x1
# Descending order
x2 <- 10:0
x2

## SEQ
?seq

# Ascending values
(x3 <- seq(10))

# Specify change in values
(x4 <- seq(30, 0, by = -3))

## Enter multiple values with C
# c = concatenate / combine / collect
(x5 <- c(5,4,1,6,4,2,2,3,2,8))

## SCAN
#Read data into a vector or list from the console or file
?scan
x6 <- scan()
x6

## REP
# Replicates values
?rep
x7 <- rep(TRUE, 5)
x7
x8 <- rep(c(TRUE, FALSE), 5)
x8
typeof(x8)

### IMPORT DATA ###########################################################################
# csv, txt, xlsx, json
# rio function combines all functions for each format

pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes,
               ggvis, httr, libridate, plotly, rio, rmarkdown, shiny, string, tidyr)

## RIO
rio_csv <- import("test2.csv")


## DATA VIEWER
View(rio_csv)

## READ.TABLE
r_txt1 <- read.table("text.txt", header = TRUE)
# specifying separator
r_txt2 <- read.table("text.txt", sep = "\t")

## READ.CSV
test.csv <- read.csv("test2.csv", header = TRUE)

rm(list = ls())
