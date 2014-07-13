
Project1<-read.table("household_power_consumption.txt",sep=";",header=TRUE) 
Project1$Date<-as.Date(Project1$Date,"%d/%m/%Y") 
Project1<-Project1[Project1$Date=="2007-02-01" | Project1$Date=="2007-02-02",] 
Project1$Global_active_power<-as.character(Project1$Global_active_power) 
Project1$Global_active_power<-as.numeric(Project1$Global_active_power)
#Concatenate Date and Time.
x<-paste(Project1$Date,Project1$Time)
# After concatenating date and time, the resulting vector undergoes
# transformations that will allow us to work with seconds
#(the number of seconds since 1970-01-01).
x<-as.POSIXlt(x)
x<-strptime(x,"%Y-%m-%d %H:%M:%S")
x<-as.POSIXct(x)
x<-unclass(x)
#Finally, we make the plot of time(from 2007-02-01 to 2007-02-02) vs Global 
#active power.
#The x-label corresponding to time has no label. The y-label corresponding to 
#Global active power
#is labeled Global active power.The title has no label. There are no points
#either.
plot(x,Project1$Global_active_power,xlab="",
     ylab="Global active power",type="n",main="",xaxt="n")
# 1170306000 seconds corresponds to Friday 2007-02-01 00:00:00, 
# 1170392400 seconds corresponds to Saturday 2007-02-02 00:00:00,
# 1170478740 seconds corresponds to Sunday 2007-02-02 23:59:00.
axis(1,at=c(1170306000,1170392400,1170478740),label=c("Fri","Sat","Sun"))
lines(x,Project1$Global_active_power)
#Copy the histogram as a png file and name the file as plot2.png.
dev.copy(png,"Plot2.png")
#Turn off the device
dev.off()

