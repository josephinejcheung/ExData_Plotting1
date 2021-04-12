fn <- "household_power_consumption.txt" 

#Read data
data <- read.table(fn,sep=";",header=TRUE)
df <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Voltage <- as.numeric(df$Voltage)

#Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

#Top left
plot(df$Global_active_power, type= 'l', xaxt="n", xlab ="", ylab = "Global Active Power (kilowatts)")
axis(1,at = c(0,nrow(df)/2, nrow(df)), labels = c("Thu","Fri","Sat"))
#Top right
plot(df$Voltage, type= 'l', xaxt="n", xlab ="datetime", ylab = "Voltage")
axis(1,at = c(0,nrow(df)/2, nrow(df)), labels = c("Thu","Fri","Sat"))

#bottom left 
plot(df$Sub_metering_1, type= 'l', xaxt="n", xlab ="", ylab = "Energy sub metering")
points(df$Sub_metering_2,type="l", col="red")
points(df$Sub_metering_3,type="l", col="blue")
axis(1,at = c(0,nrow(df)/2, nrow(df)), labels = c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), box.lwd=0,box.col = "transparent")
#bottom right
plot(df$Global_reactive_power, type= 'l', xaxt="n", xlab ="datetime", ylab = "Global Rective Power")
axis(1,at = c(0,nrow(df)/2, nrow(df)), labels = c("Thu","Fri","Sat"))

dev.off()