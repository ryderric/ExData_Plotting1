# Code to create plot 4 for Coursera Exploring Data Week 1

# Read in data
power <- read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = TRUE)
      
# Subset to desired dates
power <- subset(power, Date == ('1/2/2007') | (Date == '2/2/2007'))

# Format Data
datetime <- paste(power$Date, power$Time)
datetime <- as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S"))
power <- cbind(datetime, power[,-(1:2)])
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))
power$Voltage <- as.numeric(as.character(power$Voltage))
power$Global_reactive_power <- 
                  as.numeric(as.character(power$Global_reactive_power))


# Create Histograms
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

      # Plot2, with updated xlab
      plot(power$Global_active_power ~ power$datetime, 
                  type = "l", 
                  ylab = "Global Active Power", 
                  xlab = "")

      #Plot3, with updated legend
      plot(power$Sub_metering_1 ~ power$datetime, 
                  type = "l", 
                  main = "", 
                  ylab = "Energy sub metering", 
                  xlab = "")
      lines(power$Sub_metering_2 ~ power$datetime, 
                  col = "Red")
      lines(power$Sub_metering_3 ~ power$datetime, 
                  col = "Blue")
      legend("topright", 
                  col = c("Black", "Red", "Blue"), 
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                  lty = 1, 
                  bty ="n")

      # Plot the line voltage vs time
      plot(power$Voltage ~ power$datetime, 
                  xlab = "datetime", 
                  ylab = "Voltage", 
                  type = "l")

      # Plot the line reactive power vs time
      plot(power$Global_reactive_power ~ power$datetime, 
                  xlab = "datetime", 
                  ylab = "Global_reactive_power", 
                  type = "l")

#Close connection
dev.off()