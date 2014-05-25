source("dataLoader.R")

library(ggplot2)
library(reshape2)

NEI.baltimore <- NEI[NEI$fips=="24510",]
NEI.losangeles <- NEI[NEI$fips=="06037",]
SCC.vehicles <- SCC[grepl('vehicle', SCC$SCC.Level.Two, ignore.case=T),]
NEI.baltimore.vehicles <- subset(NEI.baltimore, SCC %in% SCC.vehicles$SCC)
NEI.losangeles.vehicles <- subset(NEI.losangeles, SCC %in% SCC.vehicles$SCC)

baltimore.agg <- aggregate(NEI.baltimore.vehicles$Emissions,by=list(NEI.baltimore.vehicles$year,NEI.baltimore.vehicles$type),FUN=sum)
losangeles.agg <- aggregate(NEI.losangeles.vehicles$Emissions,by=list(NEI.losangeles.vehicles$year,NEI.losangeles.vehicles$type),FUN=sum)

baltimore.agg$Source <- 'Baltimore'
losangeles.agg$Source<- 'Los Angeles County'

combined.agg <- rbind(baltimore.agg, losangeles.agg)

qplot(Group.1,x,
      data=combined.agg,
      facets=.~Source,
      geom=c('point','smooth'), method='lm',
      main='Vehicle Emissions in Baltimore and Los Angeles County',
      ylab='Tons',
      xlab='Year')