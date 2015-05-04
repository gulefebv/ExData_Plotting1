data <- read.csv2("household_power_consumption.txt", na.strings="?", stringsAsFactors=F)
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# Numeric columns
numericCols <- 3:ncol(data)
data[,numericCols] <- lapply(data[,numericCols], function(col) as.numeric(col))

# Datetime column
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- NULL

png("plot4.png")

par(mfrow = c(2, 2))

with(data, {
    plot(Time, Global_active_power, pch=".", xlab="", ylab="Global Active Power (kilowatts)")
    lines(Time, Global_active_power)
    
    plot(Time, Voltage, pch=".", xlab="datetime", ylab="Voltage")
    lines(Time, Voltage)
    
    plot(Time, Sub_metering_1, pch=".", xlab="", ylab="Energy sub metering")
    lines(Time, Sub_metering_1)
    lines(Time, Sub_metering_2, col="red")
    lines(Time, Sub_metering_3, col="blue")
    legend("topright", lty=1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(Time, Global_reactive_power, pch=".", xlab="datetime", ylab="Global_reactive_power")
    lines(Time, Global_reactive_power)
})

dev.off()
