GlobalActivePower<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",colClasses = c("character","character",rep("numeric",7)))

GlobalActivePower2007<-GlobalActivePower[GlobalActivePower$Date  %in% c("1/2/2007","2/2/2007") ,]


GlobalActivePower2007$Date_Time<-strptime(paste(GlobalActivePower2007$Date,GlobalActivePower2007$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
GlobalActivePower2007$Date_Time<-as.POSIXct(GlobalActivePower2007$Date_Time)

GlobalActivePower2007<- subset(GlobalActivePower2007,select=-c(Date,Time))

## Create the Plot
with (GlobalActivePower2007,{
  plot(Sub_metering_1~Date_Time,type="l",ylab="Energy sub metering",xlab="")
  lines(Sub_metering_2~Date_Time,col="Red")
  lines(Sub_metering_3~Date_Time,col="Blue")
  title(main="Energy sub-metering")
})
legend("topright",col=c("black","red","blue"),lty = 1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,filename="plot3.png")
dev.off()
