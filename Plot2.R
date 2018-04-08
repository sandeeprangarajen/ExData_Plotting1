setwd("D:/SANDY/Enter The Dragon/Data Science/Fhousehold_power_consumption_ASG_1")

power <- read.table("./household_power_consumption.txt",skip=1,sep=";")

names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subpower$Date), subpower$Time)
subpower$Datetime <- as.POSIXct(datetime)
plot(subpower$Datetime,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

title(main="Global Active Power Vs Time")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
