source("dataLoader.R")
NEI.baltimore <- NEI[NEI$fips==24510,]
agg <- aggregate(NEI.baltimore$Emissions,by=list(NEI.baltimore$year),FUN=sum)
png(file = "plots/plot2.png")
barplot(agg$x,names.arg=agg$Group.1,main='Baltimore PM25 Emissions',ylab='Tons',xlab='Year')
dev.off()