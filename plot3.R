##Project 1 - Graph 1

library(datasets)

#Read the project data
proj3Data <- read.csv("~/R/Exploratory Data Analysis/Project 1/data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#Convert Date column to date with day-month-year format
proj3Data$Date <- as.Date(proj3Data$Date, format="%d/%m/%Y")

#Subset the data to the parameters in the instructions
subSetproj3Data <- subset(proj3Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Remove the large dataset from memory for performance
rm(proj3Data)

#Format the date
datetime <- paste(as.Date(subSetproj3Data$Date), data$Time)
subSetproj3Data$Datetime <- as.POSIXct(datetime)

#Plot 3
png("plot3.png", width=480, height=480)

with(data, {
              plot(Sub_metering_1~Datetime, type="l", 
                ylab="Energy Sub Metering", xlab="") 
              lines(Sub_metering_2~Datetime,col='Red') 
              lines(Sub_metering_3~Datetime,col='Blue') 
            }) 

#Add legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
 
dev.off()