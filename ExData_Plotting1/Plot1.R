#Read the file.
Project1<-read.table("household_power_consumption.txt",sep=";",header=TRUE) 
#Format the dates.
Project1$Date<-as.Date(Project1$Date,"%d/%m/%Y") 
#Select the dates from 2007-02-01 to 2007-02-02.
Project1<-Project1[Project1$Date=="2007-02-01" | Project1$Date=="2007-02-02",] 
#Convert Global active power to character.
Project1$Global_active_power<-as.character(Project1$Global_active_power) 
#Convert Global active power to numeric.
Project1$Global_active_power<-as.numeric(Project1$Global_active_power) 
#Plot the histogram of Global active power, label the x-axis as
#Global active power and label the title Global active power.
hist(Project1$Global_active_power,xlab="Global Active Power(Kilowatts)",
     ylab="Frequency",
     main="Global Active Power",col="red")
#Copy the histogram as a png file and name the file as plot1.png.
dev.copy(png,"plot1.png")
#Turn off the device
dev.off()
