## Exploratory Data Analysis Week 1 Project Plot2.R

# Set working directory
getwd()
setwd("G:/Data Science Course Materials/Exploratory Data Analysis/wk1")

#Read data in R from existing downloaded file (downloaded in the first step for plot1)
AddData <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
AddData$Date <- as.Date(AddData$Date, format="%d/%m/%Y")

# Subsetting data and removing the existing all dataset 
SubData <- subset(AddData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(AddData)

# Converting dates and times
datetime <- paste(as.Date(SubData$Date), SubData$Time)
SubData$DateTime <- as.POSIXct(datetime)

# Plotting the line graphs (plot2)
plot(SubData$Global_active_power~SubData$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


