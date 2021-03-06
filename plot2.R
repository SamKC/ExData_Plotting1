## import the data and assign it to "cons"
cons <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                   stringsAsFactors=FALSE, dec=".")

## subset the data "cons" based on the Date from "1/2/2007" to "2/2/2007"
subcons <- cons[cons$Date %in% c("1/2/2007","2/2/2007") ,]

## extract all the numerical values from the subsetdata(Global_active_power) of subcons 
G_A_Power <- as.numeric(subcons$Global_active_power)

## convert the character "Date" and "Time" to classes "POSIXlt" and "POSIXct" 
dateTime <- strptime(paste(subCons$Date, subCons$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## plot and label the graph
plot(dateTime, G_A_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## saved into a file named "plot2.png"
png("plot2.png", width=480, height=480)
dev.off()