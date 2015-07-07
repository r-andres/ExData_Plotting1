#
#  Data load and filtering
#

cols <- c ("character" , "character", "numeric" , "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
data <- read.csv('household_power_consumption.txt', sep = ";" , na.strings = c ('?'), colClasses = cols)
filter <- data[data$Date=='1/2/2007' | data$Date=='2/2/2007', ]

#
#  Plot generation
#

png(file = "plot1.png", bg = "transparent", width = 480, height = 480)
cd <- seq(0, 8, by=0.5)
hist(filter$Global_active_power, cd, main="Global Active Power", col = 'red', xlab = 'Global Power Active (kilowatts)', axes=FALSE)
axis(2)
axis(1, at = c (0, 2, 4, 6))
dev.off()

