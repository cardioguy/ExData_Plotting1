## plot4.R
# MBJ 5/6/14

# read CSV file - note missing values are coded as ?
# and grab 2/1 -2/2/2012 data
fileurl="household_power_consumption.txt"
DF = read.csv(fileurl,header=TRUE, sep=";",na.strings=c("?"))
startdate = strptime(c("2007-02-01"), "%Y-%m-%d")
enddate = strptime(c("2007-02-02"), "%Y-%m-%d")
DF$Date = strptime(DF$Date, "%d/%m/%Y")
DFsub <- subset(DF, Date >= startdate & Date <= enddate )

# plot it

frame()
Timeindex = 1:nrow(DFsub)
plotindices = c(3,5,4)
lnames = colnames(DFsub)
dayabbrev = c("Thu","Fri","Sat")
par(xaxt="n")
par( mfrow = c( 2, 2) ) # set up for plotting - across rows first

# plot 1 - upper right
par(xaxt="n")
with (DFsub, {  plot(Timeindex, Global_active_power, xlab="", ylab=lnames[3],type="l")  })
par(xaxt="s")
axis(Timeindex, at=c(0,nrows/2,nrows), labels=dayabbrev)

# plot 2  - upper left
par(xaxt="n")
with (DFsub, {  plot(Timeindex, Voltage, xlab="", ylab=lnames[5],type="l")  })
par(xaxt="s")
axis(Timeindex, at=c(0,nrows/2,nrows), labels=dayabbrev)

# plot 3 - lower left
par(xaxt="n")
with (DFsub, {  plot(Timeindex, Sub_metering_1, xlab="", ylab="Energy sub metering",type="l")  
                lines(Sub_metering_2,type="l",col="red")
                lines(Sub_metering_3,type="l",col="blue")  })
legend(x="topright",c(lnames[7], lnames[8], lnames[9]) , col = c("black", "blue", "red"), lty=c(1,1,1), bty="n")
par(xaxt="s")
axis(Timeindex, at=c(0,nrows/2,nrows), labels=dayabbrev)

# plot 4 - lower right
par(xaxt="n")
with (DFsub, {  plot(Timeindex, Global_reactive_power, xlab="", ylab=lnames[4],type="l")  })
par(xaxt="s")
axis(Timeindex, at=c(0,nrows/2,nrows), labels=dayabbrev)

# save plot to png file
dev.copy(png,'plot4.png')
dev.off()