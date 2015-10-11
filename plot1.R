#reading and cleaning the data
raw_data <- read.table(file = "household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")
data <- subset(raw_data, Date >= "2007-02-01" & Date <= "2007-02-02")
# Making the plot
png(file="plot1.png",width=480, height=480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
# cleaning the global environment 
rm(data, raw_data)