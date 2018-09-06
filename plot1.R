#This is an R script  for Project 1 of Exploratory Data Analysis Course 
# This script is for Plot1  - Global Active Power 

#Read the Data from the Txt file 
Data_Set<-read.table("./data/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Filter the date from the dates 2007-02-01 and 2007-02-02. 
#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
Sub_Data_Set<-Data_Set[Data_Set$Date %in% c("1/2/2007", "2/2/2007") ,]

#Convert Global_active_power to numeric 
Sub_Data_Set$Global_active_power<-as.numeric(Sub_Data_Set$Global_active_power)

#Select PNG as the output device 
png("plot1.png", width=480, height=480)

#Plot and Histogram of Global_active_power
hist(Sub_Data_Set$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

dev.off()