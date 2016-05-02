##
inputfile<-"household_power_consumption.txt"
allData <- read.table(inputfile, header=T, sep=";", na.strings="?")
## set time variable
theData <- allData[allData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(theData$Date, theData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
theData <- cbind(SetTime, theData)
##
## Generating Plot 4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(theData$SetTime, theData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(theData$SetTime, theData$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(theData$SetTime, theData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(theData$SetTime, theData$Sub_metering_2, type="l", col="red")
lines(theData$SetTime, theData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(theData$SetTime, theData$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png,file="plot4.png")
dev.off()

