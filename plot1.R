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

#Plot 1
png(filename=paste0(file_path,"plot1.png"))
hist(as.numeric(data$Global_active_power), 
     col =  "Red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()