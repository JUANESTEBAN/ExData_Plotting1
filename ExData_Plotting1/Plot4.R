par(mfcol=c(2,2))
#The first two figures in the first column are covered in codes 
#Plot2.R and Plot3.R, so I just copy the codes in the following order:
Project1<-read.table("household_power_consumption.txt",sep=";",header=TRUE) 
Project1$Date<-as.Date(Project1$Date,"%d/%m/%Y") 
Project1<-Project1[Project1$Date=="2007-02-01" | Project1$Date=="2007-02-02",] 
Project1$Global_active_power<-as.character(Project1$Global_active_power) 
Project1$Global_active_power<-as.numeric(Project1$Global_active_power)
x<-paste(Project1$Date,Project1$Time)
x<-as.POSIXlt(x)
x<-strptime(x,"%Y-%m-%d %H:%M:%S")
x<-as.POSIXct(x)
x<-unclass(x)
plot(x,Project1$Global_active_power,xlab="",
     ylab="Global active power",type="n",main="",xaxt="n")
axis(1,at=c(1170306000,1170392400,1170478740),label=c("Fri","Sat","Sun"))
lines(x,Project1$Global_active_power)
Project1$Sub_metering_1<-as.character(Project1$Sub_metering_1) 
Project1$Sub_metering_1<-as.numeric(Project1$Sub_metering_1)
Project1$Sub_metering_2<-as.character(Project1$Sub_metering_2) 
Project1$Sub_metering_2<-as.numeric(Project1$Sub_metering_2)
plot(x,Project1$Sub_metering_1,xlab="",
     ylab="Energy sub metering",type="n",main="",xaxt="n")
axis(1,at=c(1170306000,1170392400,1170478740),label=c("Fri","Sat","Sun"))
lines(x,Project1$Sub_metering_1,col="black")
lines(x,Project1$Sub_metering_2,col="red")
lines(x,Project1$Sub_metering_3,col="blue")
#This time, I remove the border with bty="n.
legend("topright",lty="solid",legend=c("Sub_metering_1",
        "Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),
       bty="n")
#Now, the last two figures in the second column are handled similarly:
Project1$Voltage<-as.character(Project1$Voltage) 
Project1$Voltage<-as.numeric(Project1$Voltage)
Project1$Global_reactive_power<-as.character(Project1$Global_reactive_power) 
Project1$Global_reactive_power<-as.numeric(Project1$Global_reactive_power)
plot(x,Project1$Voltage,xlab="datetime",
     ylab="Voltage",type="n",main="",xaxt="n")
lines(x,Project1$Voltage)
axis(1,at=c(1170306000,1170392400,1170478740),label=c("Fri","Sat","Sun"))
plot(x,Project1$Global_reactive_power,xlab="datetime",
     ylab="Global_reactive_power",type="n",main="",xaxt="n")
lines(x,Project1$Global_reactive_power)
axis(1,at=c(1170306000,1170392400,1170478740),label=c("Fri","Sat","Sun"))
dev.copy(png,"Plot4.png",900,900)
dev.off()