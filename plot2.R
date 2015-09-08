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

## Converting dates
dateTime <- as.POSIXct(paste(as.Date(dt.subset$Date), dt.subset$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

## Plot 2
png(filename="plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, typ='l', xlab="", ylab="Global Active Power (kilowatts)")

dev.off()