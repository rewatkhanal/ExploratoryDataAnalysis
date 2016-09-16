


##step - I
## Getting full dataset

full_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")


## Step -II
## Subsetting the data
sub_data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_data)


##Step - III
## Converting dates
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)


##Step - IV
## Plot 1
hist(sub_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()






