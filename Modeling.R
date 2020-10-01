#################
# MODELING DATA #
#################

### HIERARCHICAL CLUSTERING ######################################################
## EUCLIDEAN DISTANCE
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes,
               ggvis, httr, libridate, plotly, rio, rmarkdown, shiny, string, tidyr)

library(datasets)

mtcars
cars <- mtcars[, c(1:4, 6:7, 9:11)] # Select variables. first argument rows, second columns
head(cars)

# Plot clusters
# Save hierarchical clustering to hc. pipes from dplyr.
hc <- cars %>% # get cars data
      dist %>% # compute distance/dissimilarity matrix
      hclust # compute hierarchical clusters

plot(hc) # dendogram

# Add boxes around clusters
rect.hclust(hc, k = 2, border = "gray")
rect.hclust(hc, k = 3, border = "blue")
rect.hclust(hc, k = 4, border = "green4")
rect.hclust(hc, k = 5, border = "darkred")

### PRINCIPAL COMPONENT ANALYSIS ####################################################
# AKA dimensionality reduction
# Reduce dimensions but maintaining the most important information. It makes analysis and interpretation easier and more reliable.
# Steps PCA:
# - 2 variables
# - regression
# - Prependicular distance
# - Collapse
# - Rotate

# all data
pc <- prcomp(cars,
             center = TRUE, # centers means to 0
             scale = TRUE) # sets unit variance
# specific variables
pc <- prcomp(~ mpg + cyl + disp + hp + wt + qsec + am + gear + carb ,
             data = mtcars,
             center = TRUE, # centers means to 0
             scale = TRUE) 

summary(pc) # #PC == #variables
plot(pc)

# See how cases load on PCs
predict(pc) %>% round(2)

# biplot of first two components
biplot(pc)

rm(list = ls())


### REGRESSION #########################################################################
# Use many variables to predict one variable

?USJudgeRatings
head(USJudgeRatings)
data <- USJudgeRatings

# Define variable groups
x <- as.matrix(data[-12]) # contains all the predictor variables. Read all columns except number 12(retention)
y <- data[,12] # all the rows 

## Regression with simultaneous entry
reg1 <- lm(y ~ x) #linear mode. y data is predicted by or as function of x, x is all variables together being used as predictors

## Regression specify variables
reg1 <- lm(RTEN ~ CONT + INTG + DMNR + DILG + CFMG + DECI + PREP + FAMI + ORAL + WRIT + PHYS,
           data = USJudgeRatings)

# Results
reg1 # coefficients only
summary(reg1) # inferential tests
# r-squared is very high so the prediction is good

anova(reg1) # Coefficients w/inferential tests
coef(reg1) # same as reg1
confint(reg1) # CI for coefficients
resid(reg1) # Residuals case-by-case
hist(residuals(reg1)) # histogram of residuals

## ADDITIONAL MODELS
p_load(lars, caret)
