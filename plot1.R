setwd("/Users/Documents/Coursera/Data Scientist specialization/4 - Exploratory Data Analysis/Week_1")

library(data.table)
library(dplyr)

XX <- fread("household_power_consumption.txt") %>% 
      filter(Date %in% c("1/2/2007", "2/2/2007"))

XX$Global_active_power <- as.numeric(XX$Global_active_power)

png("plot1.png", width=480, height=480)
hist(XX$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()