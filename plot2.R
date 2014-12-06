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
png(file="plot2.png",width=480,height=480, units="px")
  plot(hpcdatasubset$DateTime, hpcdatasubset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", main="")
  dev.off()