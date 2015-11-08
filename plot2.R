png(filename = "plot2.png")
elecpower <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
filter_date <- subset(elecpower, (
  as.Date(Date, "%d/%m/%Y") == as.Date('01/02/2007', "%d/%m/%Y") 
  | 
    as.Date(Date, "%d/%m/%Y") == as.Date('02/02/2007', "%d/%m/%Y")
)
)
plot(strptime(paste(filter_date$Date, filter_date$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), filter_date$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()