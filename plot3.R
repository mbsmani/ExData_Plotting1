library("lubridate")

data<-read.table("household_power_consumption.txt",sep = ";")
headings<-data[1,]
names(data)<-headings

data<-data[-c(1),]
dt_st<-as.Date("2007-02-01")
dt_ed<-as.Date("2007-02-02")
data<-data[dmy(data$Date)>=dt_st,]
data<-data[dmy(data$Date)<=dt_ed,]
data["datetime"]<-as.character(strptime(paste(dmy(data$Date),data$Time,sep = " "),format = "%Y-%m-%d %H:%M:%S"))
png("plot3.png")
plot(strptime(data$datetime,format = "%Y-%m-%d %H:%M:%S"),as.numeric(data$Sub_metering_1),type = "n",xlab = "",ylab = "Energy sub metering")
points(strptime(data$datetime,format = "%Y-%m-%d %H:%M:%S"),as.numeric(data$Sub_metering_1),type = "s")
points(strptime(data$datetime,format = "%Y-%m-%d %H:%M:%S"),as.numeric(data$Sub_metering_2),type = "s",col="red")
points(strptime(data$datetime,format = "%Y-%m-%d %H:%M:%S"),as.numeric(data$Sub_metering_3),type = "s",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = c(1,1,1))
dev.off()