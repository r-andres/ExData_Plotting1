#
#  Data load and filtering
#

cols <- c ("character" , "character", "numeric" , "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
data <- read.csv('household_power_consumption.txt', sep = ";" , na.strings = c ('?'), colClasses = cols)
filter <- data[data$Date=='1/2/2007' | data$Date=='2/2/2007', ]


#
#  Prepare the datetime column
#

dateTimeStr <- paste(filter$Date, filter$Time,sep = 'T')
filter$datetime <-strptime(dateTimeStr, "%d/%m/%YT%H:%M:%S")

#
#  Plot generation
#

png(file = "plot3.png", bg = "transparent", width = 480, height = 480)
with(filter, { 
  plot(datetime, Sub_metering_1, type="l" , ylab = 'Energy sub metering', xlab = '', col="black")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue") })
legend("topright", lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()




