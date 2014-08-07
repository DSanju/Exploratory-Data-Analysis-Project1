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
#Plot1: plot commands to get histogram as png file with specific width and height
png("plot1.png", width=480, height=480, units="px")
# Global active power distribution plot
hist(as.numeric(as.character(Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
