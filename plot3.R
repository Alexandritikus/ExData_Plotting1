#reading and cleaning the data
raw_data <- read.table(file = "household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")
data <- subset(raw_data, Date >= "2007-02-01" & Date <= "2007-02-02")
data$timetemp <- paste(data$Date, data$Time)
data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")
# Making the plot
png(file="plot3.png",width=480, height=480)
plot(data$Time, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
# cleaning the global environment 
rm(data, raw_data)