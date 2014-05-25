source("dataLoader.R")

library(ggplot2)
library(reshape2)

NEI.baltimore <- NEI[NEI$fips==24510,]

agg <- aggregate(NEI.baltimore$Emissions,by=list(NEI.baltimore$year,NEI.baltimore$type),FUN=sum)
png(file = "plots/plot3.png")
qplot(Group.1,x,
           facets=.~Group.2,
           data=agg,
           geom=c('point','smooth'), method='lm',
           main='PM25 Emissions - Baltimore',
           xlab='year', color=Group.2)
dev.off()
