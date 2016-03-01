
#Merge the data of NEI and SCC
Coal_dat <- merge(NEI, SCC,by="SCC",all=TRUE )
#find the coal matches in teh vector column short.name
coalMatches  <- grepl("coal", Coal_dat$Short.Name, ignore.case=TRUE)
#extract only the matched rows
Coal_dat1<- Coal_dat[coalMatches,]
#extract the comparison of the emissions from the coal dataframe
pm25plot4 <-aggregate(Emissions~year, data=Coal_dat1, FUN= sum)
#open a png device
png('plot4.png')
#plot the device
barplot(pm25plot4$Emissions,names.arg=pm25plot4$year,xlab = "year",ylab = "Sum of Coal Emissions",main="Sum of Coal Emmissions yearly comparison",axes = TRUE)
#copy file to png
dev.copy(png,file="plot4.png",width=480,height=480)
#off the device
dev.off()
