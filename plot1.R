## Code to make the first plot

##Read the data
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE)

##Subset the data
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

##Open the png device
png("plot1.png",width=480,height=480)

##Plot the histogram
with(data,hist(Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red"))

##Close the device
dev.off()