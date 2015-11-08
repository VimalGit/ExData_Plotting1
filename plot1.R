png(filename = "plot1.png")
elecpower <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
filter_date <- subset(elecpower, (
                                  as.Date(Date, "%d/%m/%Y") == as.Date('01/02/2007', "%d/%m/%Y") 
                                   | 
                                  as.Date(Date, "%d/%m/%Y") == as.Date('02/02/2007', "%d/%m/%Y")
                                  )
                      )
hist(filter_date$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()