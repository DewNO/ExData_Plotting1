#NOTE: Please unzip the text file in the .zip provided into the "data" folder. The filepath should be "data/household_power_consumption.txt". Thank you.

hpcRaw = read.csv(file="data/household_power_consumption.txt", sep=";");
hpcData = hpcRaw[ is.element(hpcRaw$Date, c("1/2/2007", "2/2/2007")), ];

png('plot1.png')
with(hpcData, 
     hist(
        as.numeric(as.character(sub("," , ".", hpcData$Global_active_power))), 
        col="red", 
        xlab="Global Active Power (kilowatts)",
        breaks=12, 
        main="Global Active Power"
      )
)
dev.off();