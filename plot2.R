## Plot 2
## Reading datafile and subsetting data
dataFile <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataFile$Date <- as.Date(dataFile$Date, format="%d/%m/%Y")
data <- subset(dataFile, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataFile)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plotting and saving output
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()