source("dataLoader.R")

library(ggplot2)
library(reshape2)
SCC.coal <- SCC[grepl('coal', SCC$SCC.Level.Three, ignore.case=T),]

NEI.coal <- subset(NEI, SCC %in% SCC.coal$SCC)
agg <- aggregate(NEI.coal$Emissions,by=list(NEI.coal$year,NEI.coal$type),FUN=sum)

png(file = "plots/plot4.png")
qplot(Group.1,x,
           data=agg,
           geom=c('point','smooth'), method='lm',
           main='US Coal Emissions',
           ylab='Tons PM25',
           xlab='Year')
dev.off()
