#Data loader script
source("dataLoader.R")

library(ggplot2)
library(reshape2)
#Filter by coal
SCC.coal <- SCC[grepl('coal', SCC$SCC.Level.Three, ignore.case=T),]
#Subset by coal
NEI.coal <- subset(NEI, SCC %in% SCC.coal$SCC)
#Aggregate coal emission by year and type
agg <- aggregate(NEI.coal$Emissions,by=list(NEI.coal$year,NEI.coal$type),FUN=sum)
#Ploting
png(file = "plots/plot4.png")
qplot(Group.1,x,
           data=agg,
           geom=c('point','smooth'), method='lm',
           main='US Coal Emissions',
           ylab='Tons PM25',
           xlab='Year')
dev.off()
