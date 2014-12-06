##Assumes file is in working directory

#read data into R, set column classes
hpcdata<- read.csv("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, na.strings="?", colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#convert date column to correct format
hpcdata$Date<- as.Date(hpcdata$Date, format = "%d/%m/%Y")

#Subset data for dates needed
hpcdatasubset<- hpcdata[hpcdata$Date=="2007-02-01" | hpcdata$Date=="2007-02-02",]

#Create new column DateTime that combines Date and Time columns and format it
hpcdatasubset$DateTime <- paste(hpcdatasubset$Date, hpcdatasubset$Time, sep=" ")
hpcdatasubset$DateTime <- strptime(hpcdatasubset$DateTime, "%Y-%m-%d %H:%M:%S")

#Create png plot
png(filename = "plot3.png",width = 480, height = 480, units = "px")
plot(hpcdatasubset$DateTime, hpcdatasubset$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(hpcdatasubset$DateTime, hpcdatasubset$Sub_metering_2, col = "red")
lines(hpcdatasubset$DateTime, hpcdatasubset$Sub_metering_3, col = "blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid")
dev.off()

