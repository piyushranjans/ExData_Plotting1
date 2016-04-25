# Histogram of Global Active Power (Kilowatts)
###############################################################################

setwd("/Volumes/Piyush/DataScience/ExploratoryDataAnalysis")

data <- read.csv("household_power_consumption.txt",
                 header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, 
                stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Filter the data as per the two days
data_subset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting the dates
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)


## Plot 1
hist(data_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
