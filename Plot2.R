## Defining the working directory
setwd("C:\Users\Jose Noriega\Documents\R\exdata_data_household_power_consumption")
## Reading data from:"household_power_consumption.txt"

## Reading data from:"household_power_consumption.txt"
GlobalActivePower<-read.table("household_power_consumption.txt",sep=";",header = TRUE)
GlobalActivePower2007<-subset(GlobalActivePower,GlobalActivePower$Date=="1/2/2007"|GlobalActivePower$Date=="2/2/2007")

##Tranfromin Date and Time from characters into variable dates
GlobalActivePower2007$Date_Time<-strptime(paste(GlobalActivePower2007$Date,GlobalActivePower2007$Time,sep=" "),"%d/%m/%Y%H:%M:%S")

GlobalActivePower2007<- subset(GlobalActivePower2007,select=-c(Date,Time))

plot(GlobalActivePower2007$Date_Time,as.numeric(as.character(GlobalActivePower2007$Global_active_power)),type="l",xlab="",ylab="Global Active Power(kwatts)")

dev.copy(png,filename="plot2.png")

dev.off()
