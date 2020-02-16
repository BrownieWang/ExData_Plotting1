setwd("/Users/Documents/Coursera/Data Scientist specialization/4 - Exploratory Data Analysis/Week_1")

library(data.table)
library(dplyr)

XX <- fread("household_power_consumption.txt") %>% 
    filter(Date %in% c("1/2/2007", "2/2/2007"))

XX$Global_active_power <- as.numeric(XX$Global_active_power)
XX$Date_time <- strptime(paste(XX$Date, XX$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
# XX$Date <- as.Date(XX$Date, "%d/%m/%Y")
# XX$Time <- strptime(XX$Time, "%H:%M:%S")

png("plot2.png", width=480, height=480)
plot(XX$Date_time, XX$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()





