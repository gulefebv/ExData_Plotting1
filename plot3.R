data <- read.csv2("household_power_consumption.txt", na.strings="?", stringsAsFactors=F)
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# Numeric columns
numericCols <- 3:ncol(data)
data[,numericCols] <- lapply(data[,numericCols], function(col) as.numeric(col))

# Datetime column
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- NULL

png("plot3.png")

with(data, {
plot(Time, Sub_metering_1, pch=".", xlab="", ylab="Energy sub metering")
lines(Time, Sub_metering_1)
lines(Time, Sub_metering_2, col="red")
lines(Time, Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()
