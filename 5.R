source("dataLoader.R")

library(ggplot2)
library(reshape2)

NEI.baltimore <- NEI[NEI$fips==24510,]
SCC.vehicles <- SCC[grepl('vehicle', SCC$SCC.Level.Two, ignore.case=T),]
NEI.baltimore.vehicles <- subset(NEI.baltimore, SCC %in% SCC.vehicles$SCC)
agg <- aggregate(NEI.baltimore.vehicles$Emissions,by=list(NEI.baltimore.vehicles$year,NEI.baltimore.vehicles$type),FUN=sum)

png(file = "plots/plot5.png")
qplot(Group.1,x,
      data=agg,
      geom=c('point','smooth'), method='lm',
      main='Baltimore Vehice Emissions',
      ylab='Tons',
      xlab='Year')
dev.off()