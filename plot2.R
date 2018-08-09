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
png(filename = "plot2.png", width = 480, height = 480)

# Drawing plot2
plot(wDays, data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

# Closeing PNG file
dev.off()