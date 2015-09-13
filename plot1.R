##==============================================================================
## plot1.R
##==============================================================================
## Script to generate plot1.png
## With width of 480 pixels and a height of 480 pixels.
## On transparent background
##==============================================================================

## set working directory
#setwd("./Desktop/Coursera_DataScienceSpecialization/Coursera_Exploratory_Data_Analysis/Assignment_1")

## Read in data file
mydata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", as.is = TRUE, stringsAsFactors = FALSE, na.strings = "?")

# Subset data for: 2007-02-01 and 2007-02-02
mydatass <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

# Generate plot
png(file = "plot1.png", width = 480 , height = 480 )
par(bg ="transparent")
mname = "Global Active Power"
yname = "Frequency"
xname = "Global Active Power (kilowatts)"
hist(mydatass$Global_active_power, main = mname, xlab = xname, ylab = yname, col = "Red")
dev.off()

