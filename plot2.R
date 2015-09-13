##==============================================================================
## plot2.R
##==============================================================================
## Script to generate plot2.png
## With width of 480 pixels and a height of 480 pixels.
## On transparent background
##==============================================================================

## set working directory to directory containing household_power_consumption.txt
#setwd("./Desktop/Coursera_DataScienceSpecialization/Coursera_Exploratory_Data_Analysis/Assignment_1")

## Read in data file
mydata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", as.is = TRUE, stringsAsFactors = FALSE, na.strings = "?")

# Subset data for: 2007-02-01 and 2007-02-02
mydatass <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]
Datetime <- strptime(paste(mydatass$Date, mydatass$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Generate plot
png(file = "plot2.png", width = 480 , height = 480 )
par(bg ="transparent")
mname = ""
yname = "Global Active Power (kilowatts)"
xname = ""
max_x = nrow(mydatass)

plot(Datetime, mydatass$Global_active_power, main = mname, xlab = xname, ylab = yname, col = "black", type = "l")

axis(2, las=3, cex.axis=1.0)
box()

dev.off()

