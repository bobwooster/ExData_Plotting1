# R code for plot3.png
# Bob Wooster

# Read data file and subset
dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
dat$Time <- strptime(paste(dat$Date,dat$Time, sep=" "), format = "%d/%m/%Y %T")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat1 <- subset(dat, (dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02"))

# Create plot
plot(dat1$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
points(dat1$Sub_metering_2, col="red", type = "l")
points(dat1$Sub_metering_3, col="blue", type = "l")
legend(1800,39, legend=colnames(dat1)[7:9], col=c("black","red", "blue"), lty=1, bty="n", cex=0.8)
