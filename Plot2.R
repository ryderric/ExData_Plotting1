# Script to create plot 2 for Coursera Exploring Data Week 1

# Read in data
power <- read.table("household_power_consumption.txt", 
            sep = ";", 
            header = TRUE)

# Subset to desired dates
power <- subset(power, Date == '1/2/2007' | Date == '2/2/2007')

# Format Data
power$DateTime <- strptime(paste(power$Date, power$Time), 
            format="%d/%m/%Y %H:%M:%S")

# Plot histogram
png(filename='plot2.png', width=480, height=480)
plot(x=power$DateTime, 
            y=as.numeric(power$Global_active_power), 
            type='l', 
            ylab='Global Active Power (kilowatts)', 
            xlab='')

# Close png connection
dev.off()
