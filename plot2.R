# Plotting Assignment 1 for Exploratory Data Analysis 

setInternet2(use = TRUE)

# Create a folder to save plot files
if (!file.exists("./temp_p1data")) {
    dir.create("temp_p1data")
}
setwd("./temp_p1data")

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


## Plot 2
par(mfrow = c(1, 1))
p1data<-sort(p1data$Date,p1data$Time )
p1data$id <- seq(dim(p1data)[1])
d1 <- min(p1data$id)
d2 <- median(p1data$id)
d3 <- max(p1data$id)

plot(p1data$id, p1data$Global_active_power, type="l", 
    main="Plot 2: Global Active Power by Day/Time",
    ylab="Global Active Power (kilowatts)", xlab="",
    xaxt = "n")
    axis(1, at=c(d1,d2,d3), labels=c("Thursday","Friday","Saturday"))
dev.copy(png, width = 480, height = 480, units = "px", file = "plot2.png")
dev.off()

