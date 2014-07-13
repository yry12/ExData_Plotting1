# Plotting Assignment 1 for Exploratory Data Analysis 

setInternet2(use = TRUE)

if (!file.exists("./temp_p1data")) {
    dir.create("temp_p1data")
}
setwd("./temp_p1data")

#
URL <- "http://mlr.cs.umass.edu/ml/machine-learning-databases/00235/"
FILE <- "household_power_consumption.zip"setwd("./temp_p1data")

URL <- "http://mlr.cs.umass.edu/ml/machine-learning-databases/00235/"
FILE <- "household_power_consumption.zip"
download.file(paste(URL,FILE,sep=""),FILE)
unzipped <- unz(FILE,"household_power_consumption.txt")

# Check size of file
object.size(unzipped )
# My laptop has enough memory to process this data

# Import CSV file using read.csv command,  values "?" are identified as missing 
p1data <- read.csv(unzipped , header = TRUE, sep=";", na.strings = c("?"))
sort(p1data$Date)
object.size(p1data )
# Restrict the observations to date 02/01/2007 and 02/02/2007
p1data<- p1data[(p1data$Date == "2/1/2007" | p1data$Date == "2/2/2007"),]
# Counting how many observations for each day we have
nowdates<- factor(p1data$Date, labels=c("2/1/2007","2/2/2007"))
table(nowdates)


## Plot 3
par(mfrow = c(1, 1))
p1data<-sort(p1data$Date,p1data$Time)
tmax=max(p1data$Sub_metering_1, p1data$Sub_metering_2,p1data$Sub_metering_3)

plot(p1data$id,p1data$Sub_metering_1, type="l", col="black", xlab="", ylab="", ylim=c(0,35), xaxt = "n")
	par(new=TRUE)
plot(p1data$id,p1data$Sub_metering_2, type="l", col="red",   xlab="", ylab="", ylim=c(0,35), xaxt = "n")
	par(new=TRUE)
plot(p1data$id,p1data$Sub_metering_3, type="l", col="blue",  xlab="", ylab="Energy Sub Metering", ylim=c(0,35), xaxt = "n")
    axis(1, at=c(d1,d2,d3), labels=c("Thursday","Friday","Saturday"))
title(main = "Plot 3: Energy Sub Metering, by Type") 
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,col=c("black", "red", "blue"))
dev.copy(png, width = 480, height = 480, units = "px", file = "plot3.png")
dev.off()

