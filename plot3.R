#read data from household_power_consumption.txt
data <- read.table("./household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

#subset data with dates 2007-02-01 and 2007-02-02
NewData <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]

#convert Date and Time variables to Date/Time
NewData$DateTime <- strptime(paste(NewData$Date,NewData$Time),"%d/%m/%Y %H:%M:%S")

#make plot3
png(file = "plot3.png", width = 480, height = 480)
plot(NewData$DateTime, NewData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(NewData$DateTime, NewData$Sub_metering_2, type = "l", col = "red")
lines(NewData$DateTime, NewData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = names(NewData[7:9]), lty = 1, col = c("black","red","blue"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()