library(dplyr)
Sys.setlocale("LC_TIME", "English")
rawDataset = read.table("household_power_consumption.txt", header=T,sep=";")

# Process dataset
usedDataset = filter(rawDataset, Date == "1/2/2007" | Date == "2/2/2007")
usedDataset$Global_active_power = as.numeric(as.character(usedDataset$Global_active_power))
usedDataset$Sub_metering_1 = as.numeric(as.character(usedDataset$Sub_metering_1))
usedDataset$Sub_metering_2 = as.numeric(as.character(usedDataset$Sub_metering_2))
usedDataset$Sub_metering_3 = as.numeric(as.character(usedDataset$Sub_metering_3))
usedDataset$Voltage = as.numeric(as.character(usedDataset$Voltage))
usedDataset$Global_reactive_power = as.numeric(as.character(usedDataset$Global_reactive_power))

# merge date and time
library(lubridate)
usedDataset$Date = as.character(usedDataset$Date)
usedDataset$Time = as.character(usedDataset$Time)
datetime = paste(usedDataset$Date, usedDataset$Time)
datetime2 = dmy_hms(datetime)
usedDataset$Datetime = datetime2

# plot figure2
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

with(usedDataset,plot(Datetime, Global_active_power, type="n", xlab=""))
with(usedDataset,lines(Datetime, Global_active_power))

dev.off()