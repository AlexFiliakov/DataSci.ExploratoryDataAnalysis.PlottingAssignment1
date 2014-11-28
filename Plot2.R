### This file reads a subset of household power consumption data (edited to be from Feb 1 2007 to Feb 2 2007)
### and outputs Plot 2 as specified in the Coursera Exploratory Data Analysis Project 1

data<-read.table("C:/Users/afiliakov/R/Coursera/ExpData/ExData_Plotting1/household_power_consumption-feb1-feb2-2007.txt",
                 sep=";",
                 header=T)

###Convert to DateTime (we only have 2 dates, so this is excessive, but I wanted to keep this general)
data$Date<-as.character(data$Date)
data$Time<-as.character(data$Time)
#convert date format into one R can parse (single digits need leading 0s)
require(stringr)
dates<-sapply(data$Date,function(x) unlist(strsplit(x,split="/")))
dates[1,]<-str_sub(paste("0",dates[1,],sep=""),start=-2)
dates[2,]<-str_sub(paste("0",dates[2,],sep=""),start=-2)
dates<-paste(dates[1,],dates[2,],dates[3,],sep="/")
#parse Date+Time into a new column DateTime
data$DateTime<-strptime(paste(dates,data$Time),format="%d/%m/%Y %H:%M:%S")

#create our plot
png(filename="C:/Users/afiliakov/R/Coursera/ExpData/ExData_Plotting1/plot2.png",
    width=504,height=504,bg="transparent")
plot(data$DateTime,data$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",main="",type="n")
lines(data$DateTime,data$Global_active_power)
dev.off()