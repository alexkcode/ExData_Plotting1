x = read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings=c('?'))
x$datetime = paste(x$Date, x$Time)
x$datetime = strptime(x$datetime, format="%d/%m/%Y %H:%M:%S")
x$Date = as.Date(x$Date, "%d/%m/%Y")
x = subset(x, (Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02")))
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "")
with(x, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(x, points(datetime, Sub_metering_2, type="l", col="red"))
with(x, points(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red","blue"))
dev.off()