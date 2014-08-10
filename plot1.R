x = read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings=c('?'))
x$Date = as.Date(x$Date, "%d/%m/%Y")
x = subset(x, (Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02")))
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "")
with(x, hist(Global_active_power, main="Global Active Power",
     col="red", xlab="Global Active Power (kilowatts)", 
     xlim=c(0,6), ylim=c(0,1200), xaxp=c(0, 6, 3)))
dev.off()