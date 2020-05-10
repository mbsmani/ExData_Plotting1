library("lubridate")

data<-read.table("household_power_consumption.txt",sep = ";")
headings<-data[1,]
names(data)<-headings

data<-data[-c(1),]
dt_st<-as.Date("2007-02-01")
dt_ed<-as.Date("2007-02-02")
data<-data[dmy(data$Date)>=dt_st,]
data<-data[dmy(data$Date)<=dt_ed,]
png("plot1.png")
hist(as.numeric(data$Global_active_power),col="red",main="Global Active Power",xlab = "Global Active Power(kilowatts)",ylim = c(0,1200))
dev.off()