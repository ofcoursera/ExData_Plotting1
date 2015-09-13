##==============================================================================
## plot4.R
##==============================================================================
## Script to generate plot4.png
## With width of 480 pixels and a height of 480 pixels.
## On transparent background.
##==============================================================================

## set working directory to directory containing household_power_consumption.txt
#setwd("./Desktop/Coursera_DataScienceSpecialization/Coursera_Exploratory_Data_Analysis/Assignment_1")

## Read in data file
mydata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", as.is = TRUE, stringsAsFactors = FALSE, na.strings = "?")

## Subset data for: 2007-02-01 and 2007-02-02
mydatass <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]
Datetime <- strptime(paste(mydatass$Date, mydatass$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

### Generate plots ###

png(file = "plot4.png", width = 480 , height = 480 )
par(bg ="transparent")
par(mfrow=c(2,2))


# Upper left plot
mname = ""
yname = "Global Active Power"
xname = ""
max_x = nrow(mydatass)

plot(Datetime, mydatass$Global_active_power, main = mname, xlab = xname, ylab = yname, col = "black", type = "l")
axis(2, las=3, cex.axis=1.0)
box()


## Upper right plot
mname = ""
yname = "Voltage"
xname = "datetime"
max_x = nrow(mydatass)

plot(Datetime, mydatass$Voltage, main = mname, xlab = xname, ylab = yname, col = "black", type = "l")
axis(2, las=3, cex.axis=1.0)
box()


## Lower left plot
mname = ""
yname = "Energy sub metering"
xname = ""
max_x = nrow(mydatass)
mycolours = c("black", "red", "blue")
mylegend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")

plot(Datetime, mydatass$Sub_metering_1, main = mname, xlab = xname, ylab = yname, col = mycolours[1], type = "l")
lines(Datetime, mydatass$Sub_metering_2, col = mycolours[2], type = "l")
lines(Datetime, mydatass$Sub_metering_3, col = mycolours[3], type = "l")
axis(2, las=3, cex.axis=1.0)
legend(x="topright", legend=mylegend, cex=1.0, col=mycolours, lty=1, bty="n");
box()


# Lower right plot
mname = ""
yname = "Global_reactive_power"
xname = "datetime"
max_x = nrow(mydatass)

plot(Datetime, mydatass$Global_reactive_power, main = mname, xlab = xname, ylab = yname, col = "black", type = "l")
axis(2, las=3, cex.axis=1.0)
box()


# turn off device
dev.off()

