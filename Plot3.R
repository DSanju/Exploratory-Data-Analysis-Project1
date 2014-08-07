#Exploratory Data Analysis - Project1
#Url of the data set
Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#Downloading file to the working directory
download.file(Url, destfile="household_power_consumption.zip")
#Reading text file from working directory
power_consumption <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"),
                                header=T, sep=";")
#subsetting data for dates 2007-02-01 and 2007-02-02 (as.Date function didn't work for me)
power_consumption2 <- power_consumption[as.character(power_consumption$Date) %in% c("1/2/2007", "2/2/2007"),]
#Concatanating date and time variable
power_consumption2$date_time = paste(power_consumption2$Date, power_consumption2$Time)
#Using strptime() function to convert to Date/Time class
power_consumption2$date_time <- strptime(power_consumption2$date_time, format="%d/%m/%Y %H:%M:%S") ##THIS COMMAND IS NOT WORKING
attach(power_consumption2)
png("plot3.png", width=480, height=480, units="px")
#Energy submetering plot
plot(date_time, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(date_time, as.numeric(as.character(Sub_metering_2)), col="red")
lines(date_time, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()