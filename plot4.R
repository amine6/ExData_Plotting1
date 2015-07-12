## Code to make the fourth plot

##Read the data
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE)

##Subset the data
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

##Merge Date and Time in a  new column
data <- cbind(data,CompleteTime=paste(data$Date,data$Time,sep=","))

##Transform this column into time object
data$CompleteTime <- strptime(data$CompleteTime,format="%d/%m/%Y,%H:%M:%S")

##Open the png device
png("plot4.png",width=480,height=480)

##Plot 
par(mfrow=c(2,2))

with(data,plot(CompleteTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

with(data,plot(CompleteTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))

with(data,plot(CompleteTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(data,points(CompleteTime,Sub_metering_2,type="l",col="red"))
with(data,points(CompleteTime,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=c(1,1,1),bty="n")

with(data,plot(CompleteTime,Global_reactive_power,type="l",xlab="datetime"))


##Close the device
dev.off()