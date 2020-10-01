####################
# BASIC STATISTICS #
####################

# After the visualizations get some precision by getting numerical or statistical information
# Count for categories
# Count for frequencies
# Quartiles & mean for quantitative variables

library(datasets)

### SUMARY() ########################################################
summary(iris$Species) # Categorical var
summary(iris$Sepal.Length) # Quantitative var
summary(iris) 

### DESCRIBE() ########################################################
# Get more detail
# n(simple size), mean, standard desviation,
# median, 10% trimmed mean, meadian absolute deviation
# min/max, range, skewness, kurtosis, 
# Standard Error
## For quantitative variables ONLY

pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes,
               ggvis, httr, libridate, plotly, rio, rmarkdown, shiny, string, tidyr)

p_load(psych)
p_help(psych)

describe(iris$Sepal.Length)
describe(iris)

### Selecting cases #############################################################
# it allows you to focus your analysis by choosing particular cases 
# By category - if you have the name of category
# By value
# Both

hist(iris$Petal.Length)
summary(iris$Petal.Length)
summary(iris$Species)# Get names and n for each species

### Select by category
## Versicolor
hist(iris$Petal.Length[iris$Species == "versicolor"], # Select petal legth when iris specie is versicolor
     main = "Petal Length: Versicolor")
## Virginica
hist(iris$Petal.Length[iris$Species == "virginica"],
     main = "Petal Length: Virginica")
## Setosa
hist(iris$Petal.Length[iris$Species == "setosa"],
     main = "Petal Length: Setosa")

### Select by Value
## Short petals only (all setosa)
hist(iris$Petal.Length[iris$Petal.Length < 2], # Select petal legth when value is <2
     main = "Petal Length < 2")

### Multiple selectors
## Short Virginica petals only 
hist(iris$Petal.Length[iris$Species == "virginica" &
                         iris$Petal.Length < 5.5], 
     main = "Petal Length: Short Virginica")

### Subsample
## Format: data[rows, columns]
# Leave rows or columns to select all
i.setosa <- iris[iris$Species == "setosa",] # Select the columns
head(i.setosa)
summary(i.setosa$Petal.Length)
hist(i.setosa$Sepal.Length)

# Clean environment
rm(list = ls())
