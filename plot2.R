x = read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings=c('?'))
x$datetime = paste(x$Date, x$Time)
x$datetime = strptime(x$datetime, format="%d/%m/%Y %H:%M:%S")
x$Date = as.Date(x$Date, "%d/%m/%Y")
x = subset(x, (Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02")))
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "")
plot(x$datetime, x$Global_active, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()