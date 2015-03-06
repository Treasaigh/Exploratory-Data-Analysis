##Project 1 - Graph 1

library(datasets)

#Read the project data
proj4Data <- read.csv("~/R/Exploratory Data Analysis/Project 1/data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#Convert Date column to date with day-month-year format
proj4Data$Date <- as.Date(proj4Data$Date, format="%d/%m/%Y")

#Subset the data to the parameters in the instructions
subSetproj4Data <- subset(proj4Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Remove the large dataset from memory for performance
rm(proj4Data)

#Format the date
datetime <- paste(as.Date(subSetproj4Data$Date), data$Time)
subSetproj4Data$Datetime <- as.POSIXct(datetime)


png("plot4.png", width=480, height=480)

#Plot 4 - 4 graphs
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(subSetproj4Data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power",xlab="datetime")
})

dev.off()