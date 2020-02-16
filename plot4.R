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
XX$Voltage <- as.numeric(XX$Voltage)
XX$Global_reactive_power <- as.numeric(XX$Global_reactive_power)



png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
## plot 1
plot(XX$Date_time, XX$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power")

## plot 2
plot(XX$Date_time, XX$Voltage, type = "l",
     xlab = "datetime",
     ylab = "Voltage")

## plot 3
plot(XX$Date_time,  XX$Sub_metering_1, type = "l",
     xlab = "",
     ylab = "Energy sub metering")                                 # Draw first line
lines(XX$Date_time, XX$Sub_metering_2, type = "l", col = "red")                   # Add second line
lines(XX$Date_time, XX$Sub_metering_3, type = "l", col = "blue")                 # Add third line

legend("topright",                                       # Add legend to plot
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       box.lty = 0,
       col = c("black", "red", "blue"),
       lty = 1)

## plot 4
plot(XX$Date_time, XX$Global_reactive_power, type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
