# Stephen Goldberger
# 8/9/14
# Exploratory Data Analysis
# plot3.R

# Read in Data and convert Date/Time
pow <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
pdt <- paste(pow$Date,"-",pow$Time)
pow$Time <- strptime(pdt, format = "%d/%m/%Y - %H:%M:%S")
pow$Date <- as.Date(pow$Date,format = "%d/%m/%Y")

#Subset to relevant time period and plot
t <- subset(pow, Date >= "2007-02-01" & Date <= "2007-02-02")
png("plot3.png", width = 480, height = 480)
with(t,plot(Time,Sub_metering_1, type = "l", col = "black",
            ylab = "Energy sub metering", xlab = " "))
lines(t$Time,t$Sub_metering_2,col = "red")
lines(t$Time,t$Sub_metering_3,col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)
dev.off()
