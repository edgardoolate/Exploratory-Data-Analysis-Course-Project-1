{
  png("Plot4.png")
  df <- read.csv("household_power_consumption.txt",sep=";")
  df$Date <- format(as.Date(df$Date,format="%d/%m/%Y"),"%Y-%m-%d")
  df2 <- df[df$Date<=as.Date("2007-02-02") & 
              df$Date>=as.Date("2007-02-01"),]
  df2$Sub_metering_1 <- as.numeric(df2$Sub_metering_1)
  df2$Sub_metering_2 <- as.numeric(df2$Sub_metering_2)
  df2$Sub_metering_3 <- as.numeric(df2$Sub_metering_3)
  df2$Voltage <- as.numeric(df2$Voltage)
  df2$Global_active_power <- as.numeric(df2$Global_active_power)
  df2$Global_reactive_power <- as.numeric(df2$Global_reactive_power)
  
  
  
  xx <- 1:2880
  
  a <- length(xx)
  b <- length(df2$Sub_metering_1)
  
  par(mfrow = c(2, 2))
  
  plot(x,df2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",
       xlab="",bty="o",ylim=c(0,8),xlim=c(0,3000),xaxt="n")
  friday <- match("23:59:00",df2$Time)
  axis(1,at=c(0,friday,2880),label=c("Thu","Fri","Sat"))
  
  plot(x,df2$Voltage,type="l",ylab="Voltage",
       xlab="datetime",bty="o",ylim=c(230,250),xlim=c(0,3000),xaxt="n")
  friday <- match("23:59:00",df2$Time)
  axis(1,at=c(0,friday,2880),label=c("Thu","Fri","Sat"))
  
  plot(xx,df2$Sub_metering_1,type="l",ylab="Energy sub metering",
       xlab="",bty="o",ylim=c(0,40),xlim=c(0,3000),xaxt="n",bty="o")
  points(xx, df2$Sub_metering_2, col="red", type="l")
  points(xx, df2$Sub_metering_3, col="blue", type="l")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col=c("black","red","blue"),lty=c(1,1,1), ncol=1)
  #str(df2)
  friday <- match("23:59:00",df2$Time)
  axis(1,at=c(0,friday,2880),label=c("Thu","Fri","Sat"))
  
  plot(x,df2$Global_reactive_power,type="l",ylab="Global Reactive Power (kilowatts)",
       xlab="datetime",bty="o",ylim=c(0,0.5),xlim=c(0,3000),xaxt="n")
  friday <- match("23:59:00",df2$Time)
  axis(1,at=c(0,friday,2880),label=c("Thu","Fri","Sat"))
  dev.off()
}
