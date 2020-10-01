# Load packages

install.packages("pacman")

require(pacman)
library(pacman)

pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes,
               ggvis, httr, libridate, plotly, rio, rmarkdown, shiny, string, tidyr)

library(datasets) # load manually

# Clear packages
p_unload(dplyr, tidyr, stringr)
p_unload(all)
detach("package:datasets", unload = TRUE)

# Clear console
cat("\014") # cntrl + L