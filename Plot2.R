#reading the data
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')

colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

#create new variable
datetime <- paste(dat$Date,dat$Time)
datetime_fixed  <- strptime(datetime,format ="%d/%m/%Y %H:%M:%S")

#2nd plot 
png(file="plot2.png")
plot(dat$datetime_fixed,dat$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="", type="l" )
dev.off()
