##setwd("C:/Cousera/Module4/CourseProject1")

library(data.table)
library(lubridate)

## Get dataset
dataFile <- "C:/Cousera/Module4/CourseProject1/data/household_power_consumption.txt"
dt<-fread(dataFile, colClasses = "character", na.strings="?")

dt$Date <- as.Date(dt$Date,format="%d/%m/%Y")

## Subset data
dt.subset<-dt[dt$Date=="2007-02-01" | dt$Date=="2007-02-02",]
globalActivePower<-as.numeric(dt.subset$Global_active_power)
globalReactivePower<-as.numeric(dt.subset$Global_reactive_power)

## Converting dates
dateTime <- as.POSIXct(paste(as.Date(dt.subset$Date), dt.subset$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

## Plot 4
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(dateTime, globalActivePower, typ='l', xlab="", ylab="Global Active Power")
plot(dateTime, dt.subset$Voltage, typ='l', xlab="datetime", ylab="Voltage")
plot(dateTime, dt.subset$Sub_metering_1, col="black", typ='l', xlab="", ylab="Energy sub metering")
lines(dateTime, dt.subset$Sub_metering_2, col="red",lwd=2.5)
lines(dateTime, dt.subset$Sub_metering_3, col="blue",lwd=2.5)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2,2,2), cex=.75, col=c("black","red","blue")) 
plot(dateTime, globalReactivePower, typ='l', xlab="datetime", ylab="Global_reactive_power")

dev.off()