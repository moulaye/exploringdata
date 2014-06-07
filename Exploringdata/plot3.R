#location of file
filelocation <- "household_main_data.txt"

#read file and create data set
dataset <- read.table(filelocation,sep=";",na.strings="?",header=T)

#merge date and time columns to create new column
dateandtime <- strptime(paste(dataset$gooddates,dataset$Time,sep=""),format="%Y-%m-%d%H:%M:%S")

#create new data frame, adding new column
newdataset <- data.frame(dateandtime,dataset)


#generate plot 3
png(file="plot3.png",bg="transparent",width=480,height=480)
with(newdataset,plot(dateandtime,Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")) 
with(newdataset,lines(dateandtime,Sub_metering_2,type="l",col="red"))
with(newdataset,lines(dateandtime,Sub_metering_3,type="l",col="deepskyblue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","deepskyblue"))
dev.off()