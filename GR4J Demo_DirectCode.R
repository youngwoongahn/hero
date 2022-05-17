# Load required libraries
library(airGRteaching)

# Set working directory
setwd("c:/Users/z2212104/OneDrive - UNSW/Teaching/2020/CVEN9612/Presentations/GR4J_demo")

# Read in Data
mod_data <- read.table("hydro_all.csv",sep=",",header=TRUE)
mod_data$DatesR <- as.POSIXct(mod_data$DatesR,tz = "UTC") # convert dates to a date object in R 

# Prepare data
prep <- PrepGR(ObsDF = mod_data,HydroModel = "GR4J",CemaNeige = FALSE)

# Calibrate the model
calmod <- CalGR(PrepGR = prep,CalCrit = "NSE",WupPer = NULL,CalPer = c("1972-01-01","1992-12-31"))

# Simulate the model
simmod <- SimGR(PrepGR = prep,CalGR = calmod,EffCrit = "NSE",SimPer = c("1992-01-01","2014-12-31"))

# Use AirGR default plot
plot(simmod)

# Extract simulated flow and plot manually
Qsim <- simmod$OutputsModel$Qsim
plot(simmod$OutputsModel$Prod,type="l")

# Extract calibration parameters
calmod$OutputsCalib$ParamFinalR # values of model parameters
calmod$OutputsCalib$CritFinal # value of calibrated objective function
