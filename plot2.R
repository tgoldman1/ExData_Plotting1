#read in the data, subset, and convert to date and time
dat<-read.table("./household_power_consumption.txt", quote="", sep=";", header=TRUE, stringsAsFactors=FALSE)

subdat<-subset(dat, (Date=="1/2/2007" | Date=="2/2/2007"))
dateTime<-paste(subdat$Date, subdat$Time)
dateTime<-strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
cleandat<-cbind(dateTime,subdat[-c(1:2)])

#create graphics device and plot
png(filename = "plot2.png", width = 480, height = 480)
plot(cleandat$Global_active_power~cleandat$dateTime, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()