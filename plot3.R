## Code to make the third plot

##Read the data
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE)

##Subset the data
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

##Merge Date and Time in a  new column
data <- cbind(data,CompleteTime=paste(data$Date,data$Time,sep=","))

##Transform this column into time object
data$CompleteTime <- strptime(data$CompleteTime,format="%d/%m/%Y,%H:%M:%S")

##Open the png device
png("plot3.png",width=480,height=480)

##Plot 
with(data,plot(CompleteTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(data,points(CompleteTime,Sub_metering_2,type="l",col="red"))
with(data,points(CompleteTime,Sub_metering_3,type="l",col="blue"))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=c(1,1,1))

##Close the device
dev.off()