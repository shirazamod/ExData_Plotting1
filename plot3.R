## Plot 3

## read in the data
elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## convert date and time to R formats
elec$Time <- strptime(paste(elec$Date, elec$Time), format = "%d/%m/%Y %H:%M:%S")
elec$Date <- as.Date(elec$Date, format = "%d/%m/%Y")

## subset data for the first two days of February 2007
elec <- elec[elec$Date >= "2007-02-01",]
elec <- elec[elec$Date <= "2007-02-02",]

## plot line graph
with(elec, plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", main = ""))
with(elec, lines(Time, Sub_metering_1))
with(elec, lines(Time, Sub_metering_2, col="red"))
with(elec, lines(Time, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

## write the plot to PNG file

dev.copy(png, filename="Plot3.png")
dev.off()
