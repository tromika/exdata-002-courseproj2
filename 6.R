#Data loader script
source("dataLoader.R")

library(ggplot2)
library(reshape2)
#Filter data by source(Baltimore City and Los Angeles County)
NEI.baltimore <- NEI[NEI$fips=="24510",]
NEI.losangeles <- NEI[NEI$fips=="06037",]
#Filter by vehicle
SCC.vehicles <- SCC[grepl('vehicle', SCC$SCC.Level.Two, ignore.case=T),]
#Subseting in both  Baltimore and Los Angeles by type
NEI.baltimore.vehicles <- subset(NEI.baltimore, SCC %in% SCC.vehicles$SCC)
NEI.losangeles.vehicles <- subset(NEI.losangeles, SCC %in% SCC.vehicles$SCC)
#Aggregate emission by year and type in both 
baltimore.agg <- aggregate(NEI.baltimore.vehicles$Emissions,by=list(NEI.baltimore.vehicles$year,NEI.baltimore.vehicles$type),FUN=sum)
losangeles.agg <- aggregate(NEI.losangeles.vehicles$Emissions,by=list(NEI.losangeles.vehicles$year,NEI.losangeles.vehicles$type),FUN=sum)
#Source added for facets
baltimore.agg$Source <- 'Baltimore'
losangeles.agg$Source<- 'Los Angeles County'
#Merge the data
combined.agg <- rbind(baltimore.agg, losangeles.agg)
#Ploting
png(file = "plots/plot6.png")
qplot(Group.1,x,
      data=combined.agg,
      facets=.~Source,
      geom=c('point','smooth'), method='lm',
      main='Vehicle Emissions in Baltimore and Los Angeles County',
      ylab='Tons',
      xlab='Year')
dev.off()