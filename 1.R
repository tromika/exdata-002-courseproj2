#Data loader script
source("dataLoader.R")
#Aggregate emission by year
agg <- aggregate(NEI$Emissions,by=list(NEI$year),FUN=sum)
#Ploting
png(file = "plots/plot1.png")
barplot(agg$x,names.arg=agg$Group.1,main='US PM25 Emissions',ylab='Tons',xlab='Year')
dev.off()