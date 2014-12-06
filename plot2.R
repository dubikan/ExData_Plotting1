if (!any(list.files()=="household_power_consumption.txt")) {
    filename<-"exdata-data-household_power_consumption.zip"
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",filename)
    unzip(filename)
}
data<-read.table("household_power_consumption.txt",sep = ";",na.strings = "?", header = TRUE,stringsAsFactors = FALSE)
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data2<-rbind(data[data$Date=="2007-02-01",],data[data$Date=="2007-02-02",])
data2$Time<-strptime(paste(data2$Date,data2$Time),format="%F %T")
png("plot2.png")
with(data2,plot(Time,Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab=""))
with(data2,lines(Time,Global_active_power))
dev.off()
