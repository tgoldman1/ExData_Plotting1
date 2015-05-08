#set working directory, download data, and unzip
setwd("./Coursera-ExploratoryDataAnalysis/Project1")

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./dataset.zip")
unzip("./dataset.zip")

#read in the data, subset, and convert to date and time
dat<-read.table("./household_power_consumption.txt", quote="", sep=";", header=TRUE, stringsAsFactors=FALSE)

subdat<-subset(dat, (Date=="1/2/2007" | Date=="2/2/2007"))
dateTime<-paste(subdat$Date, subdat$Time)
dateTime<-strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
cleandat<-cbind(dateTime,subdat[-c(1:2)])
cleandat$Global_active_power<-as.numeric(cleandat$Global_active_power)

#create graphics device and plot
png(filename = "plot1.png", width = 480, height = 480)
hist(cleandat$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

