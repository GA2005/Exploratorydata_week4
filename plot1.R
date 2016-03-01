#set file path of the fdownloaded files
file_path <- "C://DataSceince//ExploratoryData//Week4//exdata-data-NEI_data//ExploratoryData_week4"
setwd(file_path)
#read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)
#find the sum of emissions based on the year
pm25t <-aggregate(Emissions~year,NEI,sum)
#open a png device
png('plot1.png')
#plot the device
barplot(pm25t$Emissions,names.arg=pm25t$year,xlab = "year",ylab = "Sum of Emissions",main="Sum of Emmissions yearly comparison",axes = TRUE)
#copy file to png
dev.copy(png,file="plot1.png",width=480,height=480)
#off the device
dev.off()
