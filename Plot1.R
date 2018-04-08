setwd("D:/SANDY/Enter The Dragon/Data Science/Fhousehold_power_consumption_ASG_1")

#Reading, naming and subsetting power consumption data
power <- read.table("./household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")
png("plot1.png", width=480, height=480)
dev.off()
