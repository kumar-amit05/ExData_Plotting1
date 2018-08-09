# Setting the current working directory where the data file is 
setwd("D:/Rwd/EDA")

#Loading the package sqldf
library("sqldf")

# Reading data from 1st & 2nd Feb 2007
File <- "household_power_consumption.txt"
Sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
data <- read.csv.sql(File, sql=Sql, sep=";")

# creating Png file
png(filename = "plot1.png", width = 480, height = 480)

# drawing plot1

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# closing png file
dev.off()


