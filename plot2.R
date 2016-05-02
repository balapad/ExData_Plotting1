##
inputfile<-"household_power_consumption.txt"
allData <- read.table(inputfile, header=T, sep=";", na.strings="?")
## set time variable
theData <- allData[allData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(theData$Date, theData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
theData <- cbind(SetTime, theData)
##
## Generating Plot 2
plot(theData$SetTime, theData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()

