# Plot1 
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
febdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Get Clobal Active Power data in a a variable, converting string values to numeric
globalActivePower <- as.numeric(febdata$Global_active_power)

#Open png device in working directory
png("plot1.png", width=480, height=480)
hist(globalActivePower,xlab="Global Active Power(kilowatts)", ylab="Frequency"
     , col="red", main="Global Active Power" )
dev.off()
