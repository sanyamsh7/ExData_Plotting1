# reading data from household_power_consumption.txt in the working directory.
# required data is of date:  2007-02-01 and 2007-02-02
# data read is only of the above given dates

# data of given dates are from line: 66637 
# total rows to read for 2 given dates: 2880

library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", 
                     sql="select * from file where Date in ('1/2/2007','2/2/2007');", 
                     header = TRUE, sep = ";")

# combining date and time column and changing char class to datetime class.
datetime <- strptime(paste(data$Date, data$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")

# setting png graphic device
png(file = "plot2.png", height = 480, width = 480)

#plot of type :l (lines)
global_active_power <- as.numeric(data$Global_active_power)
plot(datetime, global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# closing graphic device 
dev.off()