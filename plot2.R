# R code for plot2.png
# Bob Wooster

# Read data file and subset
dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
dat$Time <- strptime(paste(dat$Date,dat$Time, sep=" "), format = "%d/%m/%Y %T")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat1 <- subset(dat, (dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02"))

# Create plot
plot(dat1$Time, dat1$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab ="")