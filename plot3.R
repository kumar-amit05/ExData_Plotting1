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

# Converting dates into a datetime string
wDays <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')

# creating Png file
png(filename = "plot3.png", width = 480, height = 480)

# Drawing plot3
plot(wDays, data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(wDays, data$Sub_metering_2,type="l",col="red")
points(wDays, data$Sub_metering_3,type="l",col="blue")

# Adding legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lwd="1")

# Closeing PNG file
dev.off()