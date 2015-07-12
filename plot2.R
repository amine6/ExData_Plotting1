## Code to make the second plot

##Read the data
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE)

##Subset the data
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

##Merge Date and Time in a  new column
data <- cbind(data,CompleteTime=paste(data$Date,data$Time,sep=","))

##Transform this column into time object
data$CompleteTime <- strptime(data$CompleteTime,format="%d/%m/%Y,%H:%M:%S")


##Open the png device
png("plot2.png",width=480,height=480)

##Plot 
with(data,plot(CompleteTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

##Close the device
dev.off()