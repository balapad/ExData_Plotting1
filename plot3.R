##
inputfile<-"household_power_consumption.txt"
allData <- read.table(inputfile, header=T, sep=";", na.strings="?")
## set time variable
theData <- allData[allData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(theData$Date, theData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
theData <- cbind(SetTime, theData)
##
## Generating Plot 3
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(theData$SetTime, theData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(theData$SetTime, theData$Sub_metering_2, col=columnlines[2])
lines(theData$SetTime, theData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
dev.copy(png,file="plot3.png")
dev.off()

