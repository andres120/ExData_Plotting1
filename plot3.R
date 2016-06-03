# Load the necessary libraries:
library(dplyr)

# Make sure the file exists:
file_path <- ""
file_name <- "household_power_consumption.txt"
data_file <- paste0(file_path, file_name)
if(!(file.exists(data_file)))
{stop("Data file not found, please make sure the file_path and file_name are right")}

# Closes any previously opened display device:
dev.off()

# Load the data:
data <- read.csv(data_file, sep = ";", 
                 stringsAsFactors = FALSE, 
                 na.strings = "?")
data <- subset(data, grepl("^[1,2]/2/2007", Date))
data <- tbl_df(data)
data_time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#Plot 3
png(filename=paste0(file_path,"plot3.png"))
plot(tiempo,data$Sub_metering_1,type="l",col="Black", 
     ylab = "Energy sub metering", xlab = "", ylim = c(0,38))
par(new=TRUE)
plot(tiempo,data$Sub_metering_2,type="l",col="Red", ylab = "", xlab = "", ylim = c(0,38))
par(new=TRUE)
plot(tiempo,data$Sub_metering_3,type="l",col="Blue", ylab = "", xlab = "", ylim = c(0,38))
par(new=FALSE)
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("Black","Red","Blue"), lwd = 1, 
       cex = 0.95)
dev.off()