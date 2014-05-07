## plot1.R
# MBJ 5/6/14

# read CSV file - note missing values are coded as ?
# and grab 2/1 -2/2/2012 data
fileurl="household_power_consumption.txt"
DF = read.csv(fileurl,header=TRUE, sep=";",na.strings=c("?"))
startdate = strptime(c("2007-02-01"), "%Y-%m-%d")
enddate = strptime(c("2007-02-02"), "%Y-%m-%d")
DF$Date = strptime(DF$Date, "%d/%m/%Y")
DFsub <- subset(DF, Date >= startdate & Date <= enddate )

## plot 1   
par( mfrow = c( 1,1) ) 
par(xaxt="n")
hist(DFsub[[3]],xlab="Global Active Power (kilowatts)",ylab="Frequency",xlim=c(0,6), ylim=c(0,1200),main = "Global Active Power", col="red")
par(xaxt="s")
axis(1, at=c(0,2,4,6), labels=c("0","2","4","6"))  # force x values to match plot

# save plot to png file
dev.copy(png,'plot1.png')
dev.off()
