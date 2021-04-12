fn <- "household_power_consumption.txt" 

#Read data
data <- read.table(fn,sep=";",header=TRUE)
df <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Global_active_power <- as.numeric(df$Global_active_power)

#Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(df$Global_active_power, type= 'l', xaxt="n", xlab ="", ylab = "Global Active Power (kilowatts)")
axis(1,at = c(0,nrow(df)/2, nrow(df)), labels = c("Thu","Fri","Sat"))
dev.off()
