
Project1<-read.table("household_power_consumption.txt",sep=";",header=TRUE) 
Project1$Date<-as.Date(Project1$Date,"%d/%m/%Y") 
Project1<-Project1[Project1$Date=="2007-02-01" | Project1$Date=="2007-02-02",] 
x<-paste(Project1$Date,Project1$Time)
x<-as.POSIXlt(x)
x<-strptime(x,"%Y-%m-%d %H:%M:%S")
x<-as.POSIXct(x)
x<-unclass(x)
#Convert Sub_metering_1 to character.
Project1$Sub_metering_1<-as.character(Project1$Sub_metering_1) 
#Convert Sub_metering_1 to numeric.
Project1$Sub_metering_1<-as.numeric(Project1$Sub_metering_1)
#Convert Sub_metering_2 to character.
Project1$Sub_metering_2<-as.character(Project1$Sub_metering_2) 
#Convert Sub_metering_2 to numeric.
Project1$Sub_metering_2<-as.numeric(Project1$Sub_metering_2)
#Finally, we make the plot of time(from 2007-02-01 to 2007-02-02) vs 
#Energy sub metering. The x-label corresponding to time has no label. 
#The y-label corresponding to Energy sub metering
#is labeled Energy sub metering.The title has no label. There are no points
#either. Three Sub metering modes are graphed with different colors,
#black,red, and blue, and a legend is displayed in the top right.
plot(x,Project1$Sub_metering_1,xlab="",
     ylab="Energy sub metering",type="n",main="",xaxt="n")
axis(1,at=c(1170306000,1170392400,1170478740),label=c("Fri","Sat","Sun"))
lines(x,Project1$Sub_metering_1,col="black")
lines(x,Project1$Sub_metering_2,col="red")
lines(x,Project1$Sub_metering_3,col="blue")
legend("topright",lty="solid",legend=c("Sub_metering_1",
"Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
#Copy the histogram as a png file and name the file as plot3.png.
dev.copy(png,"Plot3.png",900,900)
#Turn off the device
dev.off()