#reading the data
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')

colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

#create new variable
datetime <- paste(dat$Date,dat$Time)
datetime_fixed  <- strptime(datetime,format ="%d/%m/%Y %H:%M:%S")


#3rd plot
png(file="plot3.png")
plot (x= dat$datetime_fixed, y= dat$Sub_metering_1,type ="l",xlab ="",ylab = "Energy sub metering")
lines (x= dat$datetime_fixed, y= dat$Sub_metering_2, col ="red")
lines (x= dat$datetime_fixed, y= dat$Sub_metering_3, col ="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), bty="n", lwd=c(2.5,2.5,2.5),col=c("black", "red","blue"))
dev.off()