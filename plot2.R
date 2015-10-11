## Plot 2

## read in the data
elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## convert date and time to R formats
elec$Date <- as.Date(elec$Date, format = "%d/%m/%Y")
elec$Time <- strptime(elec$Time, format = "%H:%M:%S")

## subset data for the first two days of February 2007
elec <- elec[elec$Date >= "2007-02-01",]
elec <- elec[elec$Date <= "2007-02-02",]

## plot line graph
plot(elec$Date, elec$Global_active_power, type="n")
lines(elec$Date, elec$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", main = "")

## write the plot to PNG file

dev.copy(png, filename="Plot2.png")
dev.off()
