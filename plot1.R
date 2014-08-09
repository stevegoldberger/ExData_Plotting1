# Stephen Goldberger
# 8/9/14
# Exploratory Data Analysis
# plot1.R

# Read in Data and convert Date/Time
pow <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
pdt <- paste(pow$Date,"-",pow$Time)
pow$Time <- strptime(pdt, format = "%d/%m/%Y - %H:%M:%S")
pow$Date <- as.Date(pow$Date,format = "%d/%m/%Y")

#Subset to relevant time period and plot
t <- subset(pow, Date >= "2007-02-01" & Date <= "2007-02-02")
png("plot1.png", width = 480, height = 480)
hist(t$Global_active_power, col = "red", main = "Global Active Power", 
                                xlab = "Global Active Power (kilowatts)")
dev.off()
