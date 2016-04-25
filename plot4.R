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


## Plot 4
png("plot4.png")
par(mfrow=c(2,2), cex=.6)
with(data_subset, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend( "topright",
          legend = c( 'Sub_metering_1','Sub_metering_2','Sub_metering_3' ), 
          col = c( 'black','red','blue'), 
          bty = "n", lty = 1)
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Globa_reactive_power",xlab="datetime")
})

dev.off()