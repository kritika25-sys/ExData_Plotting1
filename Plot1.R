# Plot 1
dat<-read.csv('household_power_consumption.txt', header=TRUE, sep = ";")
dat1<-subset(dat, Date=="1/2/2007"| Date=="2/2/2007") 
# subsetting only data from data from the dates 2007-02-01 and 2007-02-02
png("plot1.png", height = 480, width= 480)
hist(as.numeric(dat1$Global_active_power), col = "red", 
main= "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
