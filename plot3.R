setwd("/Users/Documents/Coursera/Data Scientist specialization/4 - Exploratory Data Analysis/Week_1")

library(data.table)
library(dplyr)

XX <- fread("household_power_consumption.txt") %>% 
    filter(Date %in% c("1/2/2007", "2/2/2007"))

XX$Global_active_power <- as.numeric(XX$Global_active_power)
XX$Date_time <- strptime(paste(XX$Date, XX$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
XX$Sub_metering_1 <- as.numeric(XX$Sub_metering_1)
XX$Sub_metering_2 <- as.numeric(XX$Sub_metering_2)
XX$Sub_metering_3 <- as.numeric(XX$Sub_metering_3)



png("plot3.png", width=480, height=480)
plot(XX$Date_time,  XX$Sub_metering_1, type = "l",
     xlab = "",
     ylab = "Energy sub metering")                                 # Draw first line
lines(XX$Date_time, XX$Sub_metering_2, type = "l", col = "red")                   # Add second line
lines(XX$Date_time, XX$Sub_metering_3, type = "l", col = "blue")                 # Add third line

legend("topright",                                       # Add legend to plot
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()


