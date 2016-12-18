# R code for plot4.png
# Bob Wooster

# Read data file and subset
dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
dat$Time <- strptime(paste(dat$Date,dat$Time, sep=" "), format = "%d/%m/%Y %T")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat1 <- subset(dat, (dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02"))

# Create plot
par(mfrow = c(2,2))
plot(dat1$Time, dat1$Global_active_power, type = "l", ylab="Global Active Power", xlab ="", cex.lab = 0.7, cex.axis=0.8)
plot(dat1$Time, dat1$Voltage, type = "l", ylab="Voltage", xlab ="datetime", cex.lab=0.7, cex.axis=0.8)
plot(dat1$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering", cex.lab=0.7, cex.axis=0.8)
points(dat1$Sub_metering_2, col="red", type = "l")
points(dat1$Sub_metering_3, col="blue", type = "l")
legend(1000,39, legend=colnames(dat1)[7:9], col=c("black","red", "blue"), lty=1, bty="n", cex=0.7)
plot(dat1$Time, dat1$Global_reactive_power, type = "l", xlab ="datetime",cex.lab=0.7, cex.axis=0.8)