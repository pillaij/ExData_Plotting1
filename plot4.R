#Plot 4

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
febdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(febdata$Date, febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(febdata$Global_active_power)
globalReactivePower <- as.numeric(febdata$Global_reactive_power)
voltage <- as.numeric(febdata$Voltage)
subMeter_1 <- as.numeric(febdata$Sub_metering_1)
subMeter_2 <- as.numeric(febdata$Sub_metering_2)
subMeter_3 <- as.numeric(febdata$Sub_metering_3)

# plot 4 png file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#3
plot(datetime, subMeter_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMeter_2, type="l", col="red")
lines(datetime, subMeter_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"), bty="n")
#4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
