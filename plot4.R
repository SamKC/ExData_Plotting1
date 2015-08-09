## import the data and assign it to "cons"
cons <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                   stringsAsFactors=FALSE, dec=".")

## subset the data "cons" based on the Date from "1/2/2007" to "2/2/2007"
subcons <- cons[cons$Date %in% c("1/2/2007","2/2/2007") ,]

## extract all the numerical values from the subsetdata(Global_active_power) of subcons 
G_A_Power <- as.numeric(subcons$Global_active_power)
G_R_Power <- as.numeric(subCons$Global_reactive_power)
voltage <- as.numeric(subCons$Voltage)
subMet1 <- as.numeric(subCons$Sub_metering_1)
subMet2 <- as.numeric(subCons$Sub_metering_2)
subMet3 <- as.numeric(subCons$Sub_metering_3)

## convert the character "Date" and "Time" to classes "POSIXlt" and "POSIXct" 
dateTime <- strptime(paste(subCons$Date, subCons$Time, sep=" "), "%d/%m/%Y %H:%M:%S")



## set graphical plots 2 by 2 followed by a row and adjust margins
par(mfrow = c(2, 2),mar=c(4,4,2,1), oma=c(0,0,2,0)) 

## plot and decorate the graph
plot(dateTime, G_A_Power, type="l", xlab="", ylab="Global Active Power")
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dateTime, subMet1, type="l", xlab=" ", ylab="Energy Submetering")
lines(dateTime, subMet2, type="l", col="red")
lines(dateTime, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"),bty="n", lwd=2,cex=1)
plot(dateTime, G_R_Power, type="l", xlab="datetime", ylab="Global_reactive_power")

## saved into a file named "plot4.png"
png("plot4.png", width=480, height=480)
dev.off()