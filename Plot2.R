{
png("Plot2.png")
df <- read.csv("household_power_consumption.txt",sep=";")
df$Date <- format(as.Date(df$Date,format="%d/%m/%Y"),"%Y-%m-%d")
df2 <- df[df$Date<=as.Date("2007-02-02") & 
            df$Date>=as.Date("2007-02-01"),]
df2$Global_active_power <- as.numeric(df2$Global_active_power)
x <- 1:2880



plot(x,df2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",
     xlab="",bty="o",ylim=c(0,8),xlim=c(0,3000),xaxt="n")
friday <- match("23:59:00",df2$Time)
axis(1,at=c(0,friday,2880),label=c("Thu","Fri","Sat"))



dev.off()
}
