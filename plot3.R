if (!any(list.files()=="household_power_consumption.txt")) {
    filename<-"exdata-data-household_power_consumption.zip"
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",filename)
    unzip(filename)
}
data<-read.table("household_power_consumption.txt",sep = ";",na.strings = "?", header = TRUE,stringsAsFactors = FALSE)
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data2<-rbind(data[data$Date=="2007-02-01",],data[data$Date=="2007-02-02",])
data2$Time<-strptime(paste(data2$Date,data2$Time),format="%F %T")
png("plot3.png")
with(data2,plot(Time,Sub_metering_1,ylab="Energy sub metering",xlab="",type="n"))
with(data2,lines(Time,Sub_metering_1,col="black"))
with(data2,lines(Time,Sub_metering_2,col="red"))
with(data2,lines(Time,Sub_metering_3,col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
dev.off()