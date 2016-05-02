##
inputfile<-"household_power_consumption.txt"
allData <- read.table(inputfile, header=T, sep=";", na.strings="?")
## set time variable
theData <- allData[allData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(theData$Date, theData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
theData <- cbind(SetTime, theData)
##
## Generating Plot 1
hist(theData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()

