#Data loader script
source("dataLoader.R")
#Filter data by source(Baltimore City)
NEI.baltimore <- NEI[NEI$fips==24510,]
#Aggregate emission by year
agg <- aggregate(NEI.baltimore$Emissions,by=list(NEI.baltimore$year),FUN=sum)
#Ploting
png(file = "plots/plot2.png")
barplot(agg$x,names.arg=agg$Group.1,main='Baltimore PM25 Emissions',ylab='Tons',xlab='Year')
dev.off()