plot2<-function() {
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
                             colClasses = c("character",
                                            "character",
                                            "numeric",
                                            "NULL",
                                            "NULL",
                                            "NULL",
                                            "NULL",
                                            "NULL",
                                            "NULL"), 
                             skip = 66637, 
                             nrows = 2880)
    
    #convert col1 & col2 into Date
    dataToBePlot$Date<-strptime(paste(dataToBePlot$Date,dataToBePlot$Time,sep=" "),
                                format="%d/%m/%Y %H:%M:%S")
    
    
    # go to plot the graph, without xaxis labels (xaxt="n")
    plot(dataToBePlot$Global_active_power, 
         type="l", 
         ylab="Global Active Power (kilowatts)",
         xlab="", 
         xaxt="n")
    # add xaxis with required legend
    axis(1,  labels=c("Thu", "Fri","Sat"), at=c(0,1440,2880))
    
    # save histogram into plot1.png file into working dir
    # default res for png in R are 480x480 as required
    dev.copy(png,"plot2.png")
    dev.off()
}