GlobalActivePower<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",colClasses = c("character","character",rep("numeric",7)))

GlobalActivePower2007<-GlobalActivePower[GlobalActivePower$Date  %in% c("1/2/2007","2/2/2007") ,]


GlobalActivePower2007$Date_Time<-strptime(paste(GlobalActivePower2007$Date,GlobalActivePower2007$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
GlobalActivePower2007$Date_Time<-as.POSIXct(GlobalActivePower2007$Date_Time)

GlobalActivePower2007<- subset(GlobalActivePower2007,select=-c(Date,Time))

##png(filename = "plot3.png",width = 480,height = 480)

## Create the Plot
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with (GlobalActivePower2007,{
  plot(Global_active_power~Date_Time,type="l",ylab="Global Active Power",xlab="")
  plot(Voltage~Date_Time,type="l",xlab="datetime")
  plot(Sub_metering_1~Date_Time,type="l",ylab="Energy sub metering",xlab="")
  lines(Sub_metering_2~Date_Time,col="Red")
  lines(Sub_metering_3~Date_Time,col="Blue")
  legend("topright",col=c("black","red","blue"),lty = 1,lwd=2,bty="n",
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power~Date_Time,type="l",xlab="datetime")
})
legend("topright",col=c("black","red","blue"),lty = 1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,filename="plot5.png",width=480,height=480)
dev.off()
