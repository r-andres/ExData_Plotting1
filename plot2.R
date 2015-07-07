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

png(file = "plot2.png", bg = "transparent", width = 480, height = 480)
plot(filter$datetime, filter$Global_active_power, type="l", ylab = 'Global Power Active (kilowatts)', xlab = '')
dev.off()



