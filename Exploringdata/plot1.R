#location of file
filelocation <- "household_main_data.txt"

#read file and create data set
dataset <- read.table(filelocation,sep=";",na.strings="?",header=T)

#create plot 1
png(file="plot1.png",bg="transparent",width=480,height=480)
with(dataset,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()
