##Assumes file is in working directory

#read data into R, set column classes
hpcdata<- read.csv("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, na.strings="?", colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#convert date column to correct format
hpcdata$Date<- as.Date(hpcdata$Date, format = "%d/%m/%Y")

#Subset data for dates needed
hpcdatasubset<- hpcdata[hpcdata$Date=="2007-02-01" | hpcdata$Date=="2007-02-02",]

#Create png plot
png("plot1.png", width=480, height=480, units="px")
hist(hpcdatasubset$Global_active_power,col = "red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()