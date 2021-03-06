## Exploratory Data Analysis Week 1 Project Plot3.R

# Set working directory
getwd()
setwd("G:/Data Science Course Materials/Exploratory Data Analysis/wk1")
# Reading data downloaded in previous plot (plot1)
Alldata <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Alldata$Date <- as.Date(Alldata$Date, format="%d/%m/%Y")

## Subsetting the data
SubData <- subset(Alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Alldata)

## Converting dates
datetime <- paste(as.Date(SubData$Date), data$Time)
SubData$Datetime <- as.POSIXct(datetime)

## Plotting line graph (plot3)
with(SubData, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy Sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
