fn <- "household_power_consumption.txt" 

#Read data
data <- read.table(fn,sep=";",header=TRUE)
df <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

#Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(df$Sub_metering_1, type= 'l', xaxt="n", xlab ="", ylab = "Energy sub metering")
points(df$Sub_metering_2,type="l", col="red")
points(df$Sub_metering_3,type="l", col="blue")
axis(1,at = c(0,nrow(df)/2, nrow(df)), labels = c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()