# Plot 2
dat<-read.csv('household_power_consumption.txt', header=TRUE, sep = ";")
dat1<-subset(dat, Date=="1/2/2007"| Date=="2/2/2007")
# subsetting only data from data from the dates 2007-02-01 and 2007-02-02
dd<-NULL
for (i in 1:nrow(dat1)) {
  dd[i]<-paste(as.Date(dat1$Date,"%d/%m/%Y")[i], dat1$Time[i])
}
as.POSIXlt(dd)
png("plot2.png", height=480, width=480)
plot(dat1$Global_active_power~as.POSIXct(dd), type="l",
ylab="Global Active Power (kilowatts) ", xlab=NULL)
dev.off()
