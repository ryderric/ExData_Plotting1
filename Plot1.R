# Script to create plot 1 for Coursera Exploring Data Week 1

# Read in data
power <- read.table("household_power_consumption.txt", 
               sep = ";", 
               header = TRUE)

# Subset to desired dates
power <- subset(power, Date == '1/2/2007' | Date == '2/2/2007')

# Convert Date and Time
power$DateTime <- strptime(paste(power$Date, power$Time), 
               format="%d/%m/%Y %H:%M:%S")

# Format Data
power$Global_active_power = as.numeric(as.character(power$Global_active_power))

# Plot histogram
png("plot1.png", width = 480, height = 480)
hist(power$Global_active_power, 
               main = "Global Active Power", 
               xlab = "Global Active Power (kilowatts)", 
               col = "Red")

#CLose connection
dev.off()