## Exploratory Data Analysis Week 1 Project Plot1.R

# Setting working directory
getwd()
setwd("G:/Data Science Course Materials/Exploratory Data Analysis/wk1")

# Downloading data and unzip
if(!file.exists('data')) dir.create('data')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './data/household_power_consumption.zip')
unzip('./data/household_power_consumption.zip', exdir = './data')

# Reading data in R
DataFile <- file('./data/household_power_consumption.txt')
AllData <- read.table(DataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subsetting data
SubData <- AllData[AllData$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(SubData$Global_active_power)
head(globalActivePower)

# Remove the full dataset (AllData file from the environment)
rm(AllData)

# Plotting histogram (plot1)
with(SubData, hist(globalActivePower, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", ylab = "Frequency", col = "red"))

# Specifying the parameters and saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
