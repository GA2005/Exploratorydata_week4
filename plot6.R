#find the sum of emissions based on the year for Baltimore
subset_type <- NEI[(NEI$fips=="24510"|NEI$fips=="06037")& NEI$type=="ON-ROAD",]
pm25plot6 <- aggregate(Emissions~year+fips,data=subset_type,FUN=sum)
#open a png device
png('plot6.png')
#plot the device

g <- ggplot(pm25plot6, aes((year), Emissions))
g <- g +  geom_bar(stat="identity",fill="blue") +facet_grid(.~fips)+xlab("year")+
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions comparison in Baltimore City, and Los Angles type==ON-ROAD) from 1999 to 2008')
print(g)

#copy file to png
dev.copy(png,file="plot5.png",width=480,height=480)
#off the device
dev.off()
