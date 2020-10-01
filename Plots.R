##################
# BASIC GRAPHICS #
##################
library(datasets)

### PLOT #################################################################################

# Basic plot
?iris
head(iris)

?plot #info

plot(iris$Species) # Categorical var. 3 iris Species
plot(iris$Petal.Length) # Quantitative var. Scatter plot. It is possible to identify some differences between the 3 groups
plot(iris$Species, iris$Petal.Width) # Box plot. We can identify a very strong separation between groups for this measurement
plot(iris$Petal.Length, iris$Petal.Width) # Scatter plot. Very strong possitive association
plot(iris) # Mattrix of scatter plots of the four quantitative variables ans Species

# Better Plot with options
plot(iris$Petal.Length, iris$Petal.Width,
     col = "#cc0000",
     pch = 19, #solid circles for points
     main = "Iris: Petal Length - Petal Width",
     xlab = "Petal Length",
     ylab = "Petal Width" )

# Plot formulas
plot(cos, 0, 2*pi)
plot(exp, 1, 5)
plot(dnorm, -3,+3)

plot(dnorm, -3,+3,
     col = "#cc0000",
     lwd = 5,
     main = "Standard Normal Distribution",
     xlab = "z-scores",
     ylab = "Density"
     )


### BAR CHART ################################################################################
?mtcars
head(mtcars)

barplot(mtcars$cyl) # wrong
# need a table with frequencies for each category
cylinders <- table(mtcars$cyl) # Create table
barplot(cylinders) # Bar chart
plot(cylinders) # Default X-Y plot - line chart

### HISTOGRAM ################################################################################
# data that is quantitative, scaled, measured, interval or ratio level
# Shape of the distribution
# Gaps ( Big empty spaces in the distribution)
# Outliers ( Unusual scores)
# Symmetry ( if you have the same number of high and lowest scores or you have to do some sort of adjustement in the distribution)
hist(iris$Petal.Length) # Strong Gap with a strong bar and a gap before a bell curve
hist(iris$Petal.Width)  # same pattern
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)

# Histogram by groups 
# Easy compare different groups
# for 3 different species of iris. So we put the graphs into three rows one above another one column
par(mfrow = c(3,1))
hist(iris$Petal.Width [iris$Species == "setosa"], # the variable and the row selecction
     xlim = c(0,3), # limits for the axe
     breaks = 9, # how many bars in the histogram
     main = "Petal Width for Sectosa",
     xlab = "",
     col = "red"
     )

hist(iris$Petal.Width [iris$Species == "versicolor"], # the variable and the row selecction
     xlim = c(0,3), # limits for the axe
     breaks = 9, # how many bars in the histogram
     main = "Petal Width for Versicolor",
     xlab = "",
     col = "red"
)

hist(iris$Petal.Width [iris$Species == "virginica"], # the variable and the row selecction
     xlim = c(0,3), # limits for the axe
     breaks = 9, # how many bars in the histogram
     main = "Petal Width for Virginica",
     xlab = "",
     col = "red"
)

# Sectosa is very low. Virginica and versicolor overlap but still distinct distributions
# Restore graphic parameter
par(mfrow=c(1,1))

### SCATTERPLOTS ################################################################################
# Visualizing the association between two quantitative variables.
# Look for:
# - Association between 2 vars is linear.
# - Consistent spread accross the scores as you go.
# - Outliers. 
# - Correlation. Association between two variables.

# Check univariante distributions.
# looking for the association between weight and miles per gallon
hist(mtcars$wt)
hist(mtcars$mpg)
# Basic X-Y plot
plot(mtcars$wt, mtcars$mpg) # strong downhill pattern

plot(mtcars$wt, mtcars$mpg,
     pch = 19,
     cex = 1.50,
     col = "#cc0000",
     main= "MPG as a Function of Weight of Cars",
     xlab = "Weight (in 1000 pounds)",
     ylab = "MPG"
     )
### OVERLAYING PLOTS #############################################################
# Put one plot directly on top of superimposing it in another
# See simultaneously different perspectives
# Increase information density.

?lynx
head(lynx)
hist(lynx)
hist(lynx,
     braks = 14,
     freq = FALSE, # Axis shows density, not freq
     col = "thistle1",
     main = paste ("Histogram of Annual Canadian Lynx", "Trappings, 1821-1934"),
     xlab = "Number of  lynx Trapped",
     )

# Add a normal distribution
# See all data distributed normally. Check how far the data is from normal.
curve(dnorm(x, mean = mean(lynx), sd = sd(lynx)),
      col = "thistle4",
      lwd = 2,
      add = TRUE # Superimpose on previous graph
      )

# Add two kernel density estimators
# They are like a bell curve but they are not parametric. They say the follow distribution of data.
lines(density(lynx), col = "blue", lwd = 2) #standard kernel density stimator
lines(density(lynx, adjust = 3), col = "purple", lwd = 2) #adjust to say average across

# Rug plot
# vertical lines underneath the plot for each individual data point 
rug(lynx, lwd = 2, col = "gray")
# Individual observations marked

# Clean environment
rm(list = ls())
