## import the data and assign it to "cons"
cons <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                   stringsAsFactors=FALSE, dec=".")

## subset the data "cons" based on the Date from "1/2/2007" to "2/2/2007"
subcons <- cons[cons$Date %in% c("1/2/2007","2/2/2007") ,]

## extract all the numerical values from each subsetdata of subcons below
G_A_Power <- as.numeric(subcons$Global_active_power)
subMet1 <- as.numeric(subcons$Sub_metering_1)
subMet2 <- as.numeric(subcons$Sub_metering_2)
subMet3 <- as.numeric(subcons$Sub_metering_3)

## convert the character "Date" and "Time" to classes "POSIXlt" and "POSIXct" 
dateTime <- strptime(paste(subcons$Date, subcons$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


## saved into a file named "plot3.png"
png("plot3.png", width=480, height=480)

## plot and decorate the graph 
plot(dateTime, subMet1, type="l",xlab="", ylab="Energy Submetering")
lines(dateTime, subMet2, type="l", col="red")
lines(dateTime, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=2,cex=0.7)


dev.off()