# Stephen Goldberger
# 8/9/14
# Exploratory Data Analysis
# plot4.R

# Read in Data and convert Date/Time
pow <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
pdt <- paste(pow$Date,"-",pow$Time)
pow$Time <- strptime(pdt, format = "%d/%m/%Y - %H:%M:%S")
pow$Date <- as.Date(pow$Date,format = "%d/%m/%Y")

#Subset to relevant time period and plot
t <- subset(pow, Date >= "2007-02-01" & Date <= "2007-02-02")
png("plot4.png", width = 480, height = 480)

par(mfrow =c(2,2))
#1
with(t,plot(Time,Global_active_power, type = "l", 
            ylab = "Global Active Power" ,xlab = " "))

#2
with(t,plot(Time,Voltage, type = "l",xlab = "datetime"))

#3
with(t,plot(Time,Sub_metering_1, type = "l", col = "black",
            ylab = "Energy sub metering", xlab = " "))
lines(t$Time,t$Sub_metering_2,col = "red")
lines(t$Time,t$Sub_metering_3,col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), bty ="n", lty = 1)

#4
with(t,plot(Time,Global_reactive_power, type = "l",xlab = "datetime"))
dev.off()
