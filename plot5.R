#find the sum of emissions based on the year for Baltimore
subset_type <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]


pm25plot5 <- aggregate(Emissions~year,data=subset_type,FUN=sum)
#open a png device
png('plot5.png')
#plot the device

g <- ggplot(pm25plot5, aes(factor(year), Emissions))
g <- g +  geom_bar(stat="identity",fill="magenta") +
xlab("year") +
ylab(expression('Total PM'[2.5]*" Emissions")) +
ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510" & type==ON-ROAD) from 1999 to 2008')
print(g)

#copy file to png
dev.copy(png,file="plot5.png",width=480,height=480)
#off the device
dev.off()
