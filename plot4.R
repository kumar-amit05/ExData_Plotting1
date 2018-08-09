# Setting the current working directory where the data file is 
setwd("D:/Rwd/EDA")

#Loading the package sqldf
library("sqldf")

# Reading data from 1st & 2nd Feb 2007
File <- "household_power_consumption.txt"
Sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
data <- read.csv.sql(File, sql=Sql, sep=";")

# Loading the package lubrudate
library("lubridate")

# Convert dates into a datetime string
wDays <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')

# creating Png file
png(filename = "plot4.png", width = 480, height = 480)

# setting parameter for plot.
par(mfrow = c(2,2))

# Drawing the plot on top-left
plot(wDays, data$Global_active_power,type="l",xlab="",ylab="Global Active Power")

# Drawing the plot on top-right
plot(wDays, data$Voltage,type="l",xlab="datetime",ylab="Voltage")

# Drawing the plot on bottom-left
plot(wDays, data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(wDays, data$Sub_metering_2,type="l",col="red")
points(wDays, data$Sub_metering_3,type="l",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lwd="1")

# Drawing the plot on bottom right
plot(wDays, data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

# Close PNG device
dev.off()