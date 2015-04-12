#read data from household_power_consumption.txt
data <- read.table("./household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

#subset data with dates 2007-02-01 and 2007-02-02
NewData <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]

#convert Date and Time variables to Date/Time
NewData$DateTime <- strptime(paste(NewData$Date,NewData$Time),"%d/%m/%Y %H:%M:%S")

#set layout
par(mfcol=c(2,2))

#make plot4

#top left plot
plot(NewData$DateTime, NewData$Global_active_power, type= "l",xlab = "", ylab = "Global Active Power")
plot(NewData$DateTime, NewData$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(NewData$DateTime, NewData$Sub_metering_2, type="l", col="red")
lines(NewData$DateTime, NewData$Sub_metering_3, type="l", col="blue")
legend("topright", box.lwd=0, legend=names(NewData[7:9]), lty=1, col=c("black","red","blue"), cex=0.7)

#make plot in top right
plot(NewData$DateTime, NewData$Voltage, type= "l", xlab="datetime", ylab = "Voltage")

#make plot in top right
plot(NewData$DateTime, NewData$Global_reactive_power, type= "l", xlab="datetime", ylab="Global_reactive_power")

#copy graphic device to file
dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()
