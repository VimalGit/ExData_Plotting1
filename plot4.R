png(filename = "plot4.png")
elecpower <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
filter_date <- subset(elecpower, (
  as.Date(Date, "%d/%m/%Y") == as.Date('01/02/2007', "%d/%m/%Y") 
  | 
    as.Date(Date, "%d/%m/%Y") == as.Date('02/02/2007', "%d/%m/%Y")
)
)
par(mfrow=c(2,2))
par(mar = c(5,5,1,1))
plot(strptime(paste(filter_date$Date, filter_date$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), filter_date$Global_active_power, type="l", xlab="", ylab = "Global Active Power")
plot(strptime(paste(filter_date$Date, filter_date$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), filter_date$Voltage, type="l", xlab="datetime", ylab = "Voltage")
plot(strptime(paste(filter_date$Date, filter_date$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), filter_date$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering", xjust=1, yjust=1)
lines(strptime(paste(filter_date$Date, filter_date$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), filter_date$Sub_metering_2, col="red")
lines(strptime(paste(filter_date$Date, filter_date$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), filter_date$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), pch="-", lty=1, lwd=3, bty="n")
plot(strptime(paste(filter_date$Date, filter_date$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), filter_date$Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power")

dev.off()
