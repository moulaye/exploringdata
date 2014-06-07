#location of file
filelocation <- "household_main_data.txt"

#read file and create data set
dataset <- read.table(filelocation,sep=";",na.strings="?",header=T)

#merge date and time columns to create new column
dateandtime <- strptime(paste(dataset$gooddates,dataset$Time,sep=""),format="%Y-%m-%d%H:%M:%S")

#create new data frame, adding new column
newdataset <- data.frame(dateandtime,dataset)

#generate plot 2
png(file="plot2.png",bg="transparent",width=480,height=480)
with(newdataset,plot(dateandtime,Global_active_power,ylab="Global Active Power (Kilowatts)",type="l",xlab=""))
dev.off()

