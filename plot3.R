#find the sum of emissions based on the year for Baltimore
pm25plot3 <-aggregate(Emissions~year+type, data=NEI,  subset=NEI$fips=="24510",FUN= sum)
#open a png device
png('plot3.png')
#plot the device
g <- ggplot(pm25plot3, aes(year, Emissions, color = type))
g <- g + geom_line() +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
#copy file to png
dev.copy(png,file="plot3.png",width=480,height=480)
#off the device
dev.off()
