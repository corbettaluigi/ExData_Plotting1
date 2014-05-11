plot1<-function() {
    # Go to read data from file in dataframe dataToBePlot
    # Avoid loadin unnecessary data skipping 66637 rows, and reading next 2880
    # For sure is not parametric, but the target was construct a simple and quick script
    # for exploratory graph!
    # Alwais in this spirit, we go to read only required col
    dataToBePlot<-read.table("household_power_consumption.txt", 
                             header = FALSE, 
                             sep = ";", 
                             col.names=c("Date",
                                         "Time",
                                         "Global_active_power",
                                         "Global_reactive_power",
                                         "Voltage",
                                         "Global_intensity",
                                         "Sub_metering_1",
                                         "Sub_metering_2",
                                         "Sub_metering_3"),
                             na.strings = "?", 
                             colClasses = c("NULL",
                                            "NULL",
                                            "numeric",
                                            "NULL",
                                            "NULL",
                                            "NULL",
                                            "NULL",
                                            "NULL",
                                            "NULL"), 
                             skip = 66637, 
                             nrows = 2880)
    
    # go to draw the histogram
    hist(dataToBePlot$Global_active_power, 
         col="red", 
         main="Global Active Power", 
         xlab="Global Active Power (kilowatts)")
    
    # save histogram into plot1.png file into working dir
    # default res for png in R are 480x480 as required
    dev.copy(png,"plot1.png")
    dev.off()
}