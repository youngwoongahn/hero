# Load required libraries
library(airGRteaching)

# Set working directory
setwd("c:/Users/z2212104/OneDrive - UNSW/Teaching/2020/CVEN9612/Presentations/GR4J_demo")

# Read in Data
mod_data <- read.table("hydro_all.csv",sep=",",header=TRUE)
mod_data$DatesR <- as.POSIXct(mod_data$DatesR,tz = "UTC") # convert dates to a date object in R 

# Call the shiny code - which creates a web interface to run the model
ShinyGR(ObsDF = mod_data,SimPer = c("1972-01-01","2014-12-31"))
