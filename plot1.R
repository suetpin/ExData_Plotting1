##setwd("C:/Cousera/Module4/CourseProject1")

library(data.table)

## Get dataset
dataFile <- "C:/Cousera/Module4/CourseProject1/data/household_power_consumption.txt"
dt<-fread(dataFile, colClasses = "character", na.strings="?")

#dt$strDate <- as.Date(dt$Date,"%d/%m/%Y")
dt$Date <- as.Date(dt$Date,format="%d/%m/%Y")

## Subset data
dt.subset<-dt[dt$Date=="2007-02-01" | dt$Date=="2007-02-02",]
globalActivePower<-as.numeric(dt.subset$Global_active_power)

## Plot 1
png(filename="plot1.png", width=480, height=480)
hist(globalActivePower, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()