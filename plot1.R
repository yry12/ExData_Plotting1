# Plotting Assignment 1 for Exploratory Data Analysis 

setInternet2(use = TRUE)

# Create a folder to save plot files
if (!file.exists("./temp_p1data")) {
    dir.create("temp_p1data")
}
setwd("./temp_p1data")

#
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


## Plot 1
par(mfrow = c(1, 1))
hist(p1data$Global_active_power, breaks=12, xlim=c(0,6), col="red", main="Plot 1: Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, width = 480, height = 480, units = "px", file = "plot1.png")
dev.off()

