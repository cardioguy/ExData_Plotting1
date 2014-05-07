## plot2.R
# MBJ 5/6/14

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
par(xaxt="n")
nrows = nrow(DFsub)
Timeindex = 1:nrows
dayabbrev = c("Thu","Fri","Sat")
with (DFsub, {  plot(Timeindex, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)",type="l")  })
par(xaxt="s")
axis(Timeindex, at=c(0,nrows/2,nrows), labels=dayabbrev)

# save plot to png file
dev.copy(png,'plot2.png')
dev.off()
