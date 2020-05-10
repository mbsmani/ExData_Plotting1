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

png("plot2.png")
plot(strptime(data$datetime,format = "%Y-%m-%d %H:%M:%S"),as.numeric(data$Global_active_power),type = "s",xlab = "",ylab = "Global Active Power(kilowatts)")
dev.off()