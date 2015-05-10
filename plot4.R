#NOTE: Please unzip the text file in the .zip provided into the "data" folder. The filepath should be "data/household_power_consumption.txt". Thank you.

hpcRaw = read.csv(file="data/household_power_consumption.txt", sep=";");
hpcData = hpcRaw[ is.element(hpcRaw$Date, c("1/2/2007", "2/2/2007")), ];

png('plot4.png')
par(mfcol= c(2,2))
   plot(
     x=strptime(paste(hpcData$Date, hpcData$Time), format="%d/%m/%Y %T"),
     y=as.numeric(as.character(sub("," , ".", hpcData$Global_active_power))), 
     ylab="Global Active Power (kilowatts)",
     xlab="",
     type="l"
   );


plot(
       x=strptime(paste(hpcData$Date, hpcData$Time), format="%d/%m/%Y %T"),
       y=as.numeric(as.character(sub("," , ".", hpcData$Sub_metering_1))),
       ylab="Energy sub metering",
       xlab="",
       type="n"
);
lines(strptime(paste(hpcData$Date, hpcData$Time), format="%d/%m/%Y %T"), as.numeric(as.character(sub("," , ".", hpcData$Sub_metering_1))), col="black")
lines(strptime(paste(hpcData$Date, hpcData$Time), format="%d/%m/%Y %T"), as.numeric(as.character(sub("," , ".", hpcData$Sub_metering_2))), col="red")
lines(strptime(paste(hpcData$Date, hpcData$Time), format="%d/%m/%Y %T"), as.numeric(as.character(sub("," , ".", hpcData$Sub_metering_3))), col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n");


plot(
  x=strptime(paste(hpcData$Date, hpcData$Time), format="%d/%m/%Y %T"),
  y=as.numeric(as.character(sub("," , ".", hpcData$Voltage))), 
  ylab="Global_reactive_power",
  xlab="datetime",
  type="l"
);


plot(
  x=strptime(paste(hpcData$Date, hpcData$Time), format="%d/%m/%Y %T"),
  y=as.numeric(as.character(sub("," , ".", hpcData$Global_reactive_power))), 
  ylab="Global_reactive_power",
  xlab="datetime",
  type="l"
);

dev.off();