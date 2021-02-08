{
png("Plot1.png")
df <- read.csv("household_power_consumption.txt",sep=";")
df$Date <- format(as.Date(df$Date,format="%d/%m/%Y"),"%Y-%m-%d")
df2 <- df[df$Date<=as.Date("2007-02-02") & 
            df$Date>=as.Date("2007-02-01"),]
df2$Global_active_power <- as.numeric(df2$Global_active_power)
hist(df2$Global_active_power,main=paste("Global Active Power"),ylab="Frecuency",
     xlab="Global Active Power (kilowatts)",
     col="red",ylim=c(0,1200),yaxp=c(0,1200,6))
dev.off()
}
