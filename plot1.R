power_consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
power <- subset(power_consumption,power_consumption$Date=="1/2/2007" | power_consumption$Date =="2/2/2007")
power$Date <- as.Date(power$Date, "%d/%m/%y")
power$Time <- strptime(power$Time, format="%H:%M:%S")
power[1:1440,"Time"] <- format(power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power[1441:2880,"Time"] <- format(power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

library(magrittr)
cols = c(3,4,5,6,7,8)
power[,cols] %<>% lapply(function(x) as.numeric(as.character(x)))

png("plot1.png",width=480,height=480)
hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()