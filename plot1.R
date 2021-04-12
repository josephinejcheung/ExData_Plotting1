fn <- "household_power_consumption.txt" 

#Read data
data <- read.table(fn,sep=";",header=TRUE)
df <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Global_active_power <- as.numeric(df$Global_active_power)

#Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(df$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
