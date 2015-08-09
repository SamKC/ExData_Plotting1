## import the data and assign it to "cons"
cons <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                   stringsAsFactors=FALSE, dec=".")

## subset the data "cons" based on the Date from "1/2/2007" to "2/2/2007"
subcons <- cons[cons$Date %in% c("1/2/2007","2/2/2007") ,]

## extract all the numerical values from the subsetdata(Global_active_power) of subcons 
G_A_Power <- as.numeric(subcons$Global_active_power)

## created the histogram
hist(G_A_Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## saved into a file named "plot1.png"
png("plot1.png", width=480, height=480)
dev.off()