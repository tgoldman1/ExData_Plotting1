#read in the data, subset, and convert to date and time
dat<-read.table("./household_power_consumption.txt", quote="", sep=";", header=TRUE, stringsAsFactors=FALSE)

subdat<-subset(dat, (Date=="1/2/2007" | Date=="2/2/2007"))
dateTime<-paste(subdat$Date, subdat$Time)
dateTime<-strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
cleandat<-cbind(dateTime,subdat[-c(1:2)])

#create graphics device and plot
png(filename = "plot3.png", width = 480, height = 480)
plot(cleandat$Sub_metering_1~cleandat$dateTime, ylab="Energy sub metering", xlab="", type="n")
lines(cleandat$Sub_metering_1~cleandat$dateTime)
lines(cleandat$Sub_metering_2~cleandat$dateTime, col="red")
lines(cleandat$Sub_metering_3~cleandat$dateTime, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=1)
dev.off()
