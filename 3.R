#Data loader script
source("dataLoader.R")

library(ggplot2)
library(reshape2)
#Filter data by source(Baltimore City)
NEI.baltimore <- NEI[NEI$fips==24510,]
#Aggregate emission by year and type
agg <- aggregate(NEI.baltimore$Emissions,by=list(NEI.baltimore$year,NEI.baltimore$type),FUN=sum)
#Ploting
png(file = "plots/plot3.png")
qplot(Group.1,x,
           facets=.~Group.2,
           data=agg,
           geom=c('point','smooth'), method='lm',
           main='PM25 Emissions - Baltimore',
           xlab='year', color=Group.2)
dev.off()
