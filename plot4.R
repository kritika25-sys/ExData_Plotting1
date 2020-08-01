#Plot 4
dat<-read.csv('household_power_consumption.txt', header=TRUE, sep = ";")
dat1<-subset(dat, Date=="1/2/2007"| Date=="2/2/2007")
# subsetting only data from data from the dates 2007-02-01 and 2007-02-02
dd<-NULL
for (i in 1:nrow(dat1)) {
  dd[i]<-paste(as.Date(dat1$Date,"%d/%m/%Y")[i], dat1$Time[i])
}
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# plot1
plot(dat1$Global_active_power~as.POSIXct(dd), type="l",  
     ylab="Global Active Power (kilowatts) ", xlab=NULL)
# plot2
plot(dat1$Voltage~as.POSIXct(dd), type="l", ylab="Voltage ", xlab="datetime")
# plot3
plot(dat1$Sub_metering_1~as.POSIXct(dd), type="l", xlab=NULL, 
     ylab="Energy sub metering")
lines(dat1$Sub_metering_2~as.POSIXct(dd), type="l", col="red")
lines(dat1$Sub_metering_3~as.POSIXct(dd), type="l", col="blue")
legend("topright", bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue") , lty = 1)
#plot 4
plot(dat1$Global_reactive_power~as.POSIXct(dd), type="l", 
     ylab="Global_reactive_power (kilowatts) ", xlab="datetime")
legend(1,18,box.lty = 1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue") , lty = 1)
dev.off()
