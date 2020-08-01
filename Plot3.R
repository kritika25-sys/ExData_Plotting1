#Plot 3
dat<-read.csv('household_power_consumption.txt', header=TRUE, sep = ";")
dat1<-subset(dat, Date=="1/2/2007"| Date=="2/2/2007")
# subsetting only data from data from the dates 2007-02-01 and 2007-02-02
dd<-NULL
for (i in 1:nrow(dat1)) {
  dd[i]<-paste(as.Date(dat1$Date,"%d/%m/%Y")[i], dat1$Time[i])
}
png("plot3.png",height=480, width=480)
plot(dat1$Sub_metering_1~as.POSIXct(dd), type="l", xlab=NULL, 
     ylab="Energy sub metering")
lines(dat1$Sub_metering_2~as.POSIXct(dd), type="l", col="red")
lines(dat1$Sub_metering_3~as.POSIXct(dd), type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
col=c("black","red","blue") , lty = 1)
dev.off()
