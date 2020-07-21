# Code to create plot 3 for Coursera Exploring Data Week 1

# Read in data 
power <- read.table("household_power_consumption.txt", 
               sep = ";", 
               header = TRUE)
      
# Subset to desired dates
power <- subset(power, Date == '1/2/2007' | Date == '2/2/2007')

# Format Data
datetime <- paste(power$Date, power$Time)
datetime <- as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S"))
power <- cbind(datetime, power[,-(1:2)])
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))


# Create Histogram
png("plot3.png", width = 480, height = 480)

   # Plot sub_1
   plot(power$Sub_metering_1 ~ power$datetime, 
                  type = "l", 
                  main = "", 
                  ylab = "Energy sub metering", 
                  xlab = "")

   # Plot sub_2, colored red
   lines(power$Sub_metering_2 ~ power$datetime, 
                  col = "Red")

   # Plot sub_3, colored blue
   lines(power$Sub_metering_3 ~ power$datetime, 
                  col = "Blue")

   # Add legend
   legend("topright", 
                  col = c("Black", "Red", "Blue"), 
                  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                  lty = 1)

#Close connection
dev.off()