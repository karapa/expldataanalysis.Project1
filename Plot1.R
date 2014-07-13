
#reading the data
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')

colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

#create new variable
datetime <- paste(dat$Date,dat$Time)
datetime_fixed  <- strptime(datetime,format ="%d/%m/%Y %H:%M:%S")

#1st plot
hist(dat$Global_active_power, main=paste("Global Active Power"),xlab="Global Active Power (kilowatts)",col="red") 