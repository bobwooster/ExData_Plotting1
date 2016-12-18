# R code for plot1.png
# Bob Wooster

# Read data file and subset
dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
dat$Time <- strptime(paste(dat$Date,dat$Time, sep=" "), format = "%d/%m/%Y %T")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat1 <- subset(dat, (dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02"))

# Create histogram
hist(dat1$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")