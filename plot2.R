##Project 1 - Graph 1

library(datasets)

#Read the project data
proj2Data <- read.csv("~/R/Exploratory Data Analysis/Project 1/data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#Convert Date column to date with day-month-year format
proj2Data$Date <- as.Date(proj2Data$Date, format="%d/%m/%Y")

#Subset the data to the parameters in the instructions
subSetproj2Data <- subset(proj2Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Remove the large dataset from memory for performance
rm(proj2Data)

#Format the date
datetime <- paste(as.Date(subSetproj2Data$Date), data$Time)
subSetproj2Data$Datetime <- as.POSIXct(datetime)

#Plot 2
png("plot2.png", width=480, height=480)

plot(subSetproj2Data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
 
dev.off()