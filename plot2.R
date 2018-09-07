#This is an R script  for Project 1 of Exploratory Data Analysis Course 
# This script is for Plot2  - Global Active Power Graph 


#Load Library plyr for use of mutate
library(plyr)

#Read the Data from the Txt file 
Data_Set<-read.table("./data/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Filter the date from the dates 2007-02-01 and 2007-02-02. 
#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
Sub_Data_Set<-Data_Set[Data_Set$Date %in% c("1/2/2007", "2/2/2007") ,]

#Convert Global_active_power to numeric 
Sub_Data_Set$Global_active_power<-as.numeric(Sub_Data_Set$Global_active_power)

# Create a new columns of Date using the date and the time 
Sub_Data_Set<-mutate(Sub_Data_Set,date_time = strptime(paste(Sub_Data_Set$Date,Sub_Data_Set$Time),"%d/%m/%Y %H:%M:%S"))

#Select PNG as the output device 
png("plot1.png", width=480, height=480)

#Plot a graph of of Global_active_power versus Week Days 
plot(Sub_Data_Set$date_time,Sub_Data_Set$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")

dev.off()