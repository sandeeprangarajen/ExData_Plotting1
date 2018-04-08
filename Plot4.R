setwd("D:/SANDY/Enter The Dragon/Data Science/Fhousehold_power_consumption_ASG_1")

power <- read.table("./household_power_consumption.txt",skip=1,sep=";")

names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subpower$Date), subpower$Time)
subpower$Datetime <- as.POSIXct(datetime)


par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(subpower,{
  plot(subpower$Datetime,as.numeric(as.character(subpower$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpower$Datetime,as.numeric(as.character(subpower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpower$Datetime,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
   with(subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
   with(subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
   with(subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
   legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpower$Datetime,as.numeric(as.character(subpower$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
