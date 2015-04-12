#read data from household_power_consumption.txt
data <- read.table("./household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

#subset data with dates 2007-02-01 and 2007-02-02
NewData <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]

#convert Date and Time variables to Date/Time
NewData$DateTime <- strptime(paste(NewData$Date,NewData$Time),"%d/%m/%Y %H:%M:%S")

#make plot1
hist(NewData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()