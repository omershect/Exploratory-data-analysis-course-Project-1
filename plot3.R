#This is an R script  for Project 1 of Exploratory Data Analysis Course 
# This script is for Plot3  - Global Active Power Graph 


#Load Library plyr for use of mutate
library(plyr)

#Read the Data from the Txt file 
Data_Set<-read.table("./data/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Filter the date from the dates 2007-02-01 and 2007-02-02. 
#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
Sub_Data_Set<-Data_Set[Data_Set$Date %in% c("1/2/2007", "2/2/2007") ,]

#Convert sub_metering_1 and Sub_metering_2 to numeric values 
Sub_Data_Set$Sub_metering_1<-as.numeric(Sub_Data_Set$Sub_metering_1)
Sub_Data_Set$Sub_metering_2<-as.numeric(Sub_Data_Set$Sub_metering_2)

# Create a new columns of Date using the date and the time 
Sub_Data_Set<-mutate(Sub_Data_Set,date_time = strptime(paste(Sub_Data_Set$Date,Sub_Data_Set$Time),"%d/%m/%Y %H:%M:%S"))

#Select PNG as the output device 
png("plot3.png", width=480, height=480)

#Plot a graph the three sub metering using plot and lines 
plot(Sub_Data_Set$date_time,Sub_Data_Set$Sub_metering_1,col = "black" ,type="l",xlab="",ylab = "Energy sub metering")
lines(Sub_Data_Set$date_time,Sub_Data_Set$Sub_metering_2,col = "red" ,xlab="")
lines(Sub_Data_Set$date_time,Sub_Data_Set$Sub_metering_3,col = "blue" ,xlab="")

#Add legend
legend("topright",lty=1, cex=0.8,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()