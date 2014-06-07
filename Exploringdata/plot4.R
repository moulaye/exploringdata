#location of file
filelocation <- "household_main_data.txt"

#read file and create data set
dataset <- read.table(filelocation,sep=";",na.strings="?",header=T)

#merge date and time columns to create new column
dateandtime <- strptime(paste(dataset$gooddates,dataset$Time,sep=""),format="%Y-%m-%d%H:%M:%S")

#create new data frame, adding new column
newdataset <- data.frame(dateandtime,dataset)

#generate plot 4
png(file="plot4.png",bg="transparent",width=480,height=480)
par(mfrow=c(2,2),pty="s")
# graph 1
with(newdataset,plot(dateandtime,Global_active_power,ylab="Global Active Power",type="l",xlab=""))
# graph 2
with(newdataset,plot(dateandtime,Voltage,ylab="Voltage",type="l",xlab="datetime"))
#graph 3
with(newdataset,plot(dateandtime,Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")) 
with(newdataset,lines(dateandtime,Sub_metering_2,type="l",col="red"))
with(newdataset,lines(dateandtime,Sub_metering_3,type="l",col="deepskyblue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty='n',col=c("black","red","deepskyblue"),cex=0.90)
#graph 4
with(newdataset,plot(dateandtime,Global_reactive_power,type="l",xlab="datetime")) 
dev.off()