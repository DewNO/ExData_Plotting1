#NOTE: Please unzip the text file in the .zip provided into the "data" folder. The filepath should be "data/household_power_consumption.txt". Thank you.

hpcRaw = read.csv(file="data/household_power_consumption.txt", sep=";");
hpcData = hpcRaw[ is.element(hpcRaw$Date, c("1/2/2007", "2/2/2007")), ];

png('plot2.png')
with(hpcData, 
     plot(
       x=strptime(paste(hpcData$Date, hpcData$Time), format="%d/%m/%Y %T"),
       y=as.numeric(as.character(sub("," , ".", hpcData$Global_active_power))), 
       ylab="Global Active Power (kilowatts)",
       xlab="",
       type="l"
     )
);
dev.off();