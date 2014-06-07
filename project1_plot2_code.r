## R code for Exploratory Data Analysis
# Project 1

# Data preparation section
# Set working directory
# setwd("C:\\Users\\phu1\\Personal Data\\Documents\\Learning\\JH\\Exploratory")
colname <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colclass <- c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric")

# Read data into data frame
data <- read.table("household_power_consumption.txt", col.names=colname, colClasses=colclass, nrows =4000,sep=";", header=TRUE, skip=66000)
# Generate Timestamp and Day of week columns
data1 <- cbind(data,Timestamp = strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), Day_of_Week = weekdays(as.Date(data$Date,format="%d/%m/%Y")))

# Read into data table
library(data.table)
DT <- data.table(data1)
setkey(DT,"Date")

# Data set for analysis
pdata<- rbind(DT["1/2/2007"],DT["2/2/2007"])

#plot2
par(mfrow=c(1,1), mar=c(5,5,3,1))
dev.copy(png,"plot2.png",width=480, height=480)
with(pdata, plot(Timestamp, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
