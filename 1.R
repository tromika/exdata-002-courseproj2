## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
agg <- aggregate(NEI$Emissions,by=list(NEI$year),FUN=sum)
png(file = "plot1.png")
barplot(agg$x,names.arg=agg$Group.1)
dev.off()