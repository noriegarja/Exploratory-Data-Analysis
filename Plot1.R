## Defining the working directory
setwd("C:\Users\Jose Noriega\Documents\R\exdata_data_household_power_consumption")
## Reading data from:"household_power_consumption.txt"
GlobalActivePower<-read.table("household_power_consumption.txt",sep=";",header = TRUE)
GlobalActivePower2007<-subset(GlobalActivePower,GlobalActivePower$Date=="1/2/2007"|GlobalActivePower$Date=="2/2/2007")

hist(as.numeric(as.character(GlobalActivePower2007$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (Kwatts)")


dev.copy(png,filename="plot1.png",width=480,height=480)
dev.off()
