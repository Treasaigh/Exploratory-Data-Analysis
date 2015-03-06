##Project 1 - Graph 1

library(datasets)

#Read the project data
proj1Data <- read.csv("~/R/Exploratory Data Analysis/Project 1/data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                                check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#Convert Date column to date with day-month-year format
proj1Data$Date <- as.Date(proj1Data$Date, format="%d/%m/%Y")

#Subset the data to the parameters in the instructions
subSetproj1Data <- subset(proj1Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Remove the large dataset from memory for performance
rm(proj1Data)

#Format the date
datetime <- paste(as.Date(subSetproj1Data$Date), data$Time)
subSetproj1Data$Datetime <- as.POSIXct(datetime)

#Plot data
png("plot1.png", width=480, height=480)

hist(subSetproj1Data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red3")

dev.off()