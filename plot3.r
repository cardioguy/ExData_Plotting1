## plot3.R
# MBJ 5/6/14

## read CSV file - note missing values are coded as ?
# and grab 2/1 -2/2/2012 data
## read CSV file - note missing values are coded as ?
# and grab 2/1 -2/2/2012 data
fileurl="household_power_consumption.txt"
DF = read.csv(fileurl,header=TRUE, sep=";",na.strings=c("?"))
startdate = strptime(c("2007-02-01"), "%Y-%m-%d")
enddate = strptime(c("2007-02-02"), "%Y-%m-%d")
DF$Date = strptime(DF$Date, "%d/%m/%Y")
DFsub <- subset(DF, Date >= startdate & Date <= enddate )

# plot it
frame()
par( mfrow = c( 1,1) ) 
Timeindex = 1:nrow(DFsub)
lnames = colnames(DFsub[7:9])
dayabbrev = c("Thu","Fri","Sat")
par(xaxt="n")
with (DFsub, {  plot(Timeindex, Sub_metering_1, xlab="", ylab="Energy sub metering",type="l")  
                lines(Sub_metering_2,type="l",col="red")
                lines(Sub_metering_3,type="l",col="blue")  })
legend(x="topright",c(lnames[1], lnames[2], lnames[3]) , col = c("black", "blue", "red"), lty=c(1,1,1))
par(xaxt="s")
axis(Timeindex, at=c(0,nrows/2,nrows), labels=dayabbrev)

# save plot to png file
dev.copy(png,'plot3.png')
dev.off()
