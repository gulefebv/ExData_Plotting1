data <- read.csv2("household_power_consumption.txt", na.strings="?", stringsAsFactors=F)
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# Numeric columns
numericCols <- 3:ncol(data)
data[,numericCols] <- lapply(data[,numericCols], function(col) as.numeric(col))

# Datetime column
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- NULL

png("plot2.png")

with(data, {
    plot(Time, Global_active_power, pch=".", xlab="", ylab="Global Active Power (kilowatts)")
    lines(Time, Global_active_power)
})

dev.off()
