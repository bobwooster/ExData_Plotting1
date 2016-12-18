# R code for plot4.png
# Bob Wooster

# Read data file and subset
dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
dat$Time <- strptime(paste(dat$Date,dat$Time, sep=" "), format = "%d/%m/%Y %T")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat1 <- subset(dat, (dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02"))

# Create plot
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(dat1$Time, dat1$Global_active_power, type = "l", ylab="Global Active Power", xlab =NA)
plot(dat1$Time, dat1$Voltage, type = "l", ylab="Voltage", xlab ="datetime")
plot(dat1$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(dat1$Sub_metering_2, col="red")
lines(dat1$Sub_metering_3, col="blue")
legend("topright", legend=colnames(dat1)[7:9], col=c("black","red", "blue"), lty=1)
plot(dat1$Time, dat1$Global_reactive_power, type = "l", xlab ="datetime")
dev.off()