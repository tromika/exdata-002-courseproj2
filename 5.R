#Data loader script
source("dataLoader.R")

library(ggplot2)
library(reshape2)
#Filter data by source(Baltimore City)
NEI.baltimore <- NEI[NEI$fips==24510,]
#Filter by vehicle
SCC.vehicles <- SCC[grepl('vehicle', SCC$SCC.Level.Two, ignore.case=T),]
#Subset by type
NEI.baltimore.vehicles <- subset(NEI.baltimore, SCC %in% SCC.vehicles$SCC)
#Aggregate emission by year and type
agg <- aggregate(NEI.baltimore.vehicles$Emissions,by=list(NEI.baltimore.vehicles$year,NEI.baltimore.vehicles$type),FUN=sum)
#Ploting
png(file = "plots/plot5.png")
qplot(Group.1,x,
      data=agg,
      geom=c('point','smooth'), method='lm',
      main='Baltimore Vehice Emissions',
      ylab='Tons',
      xlab='Year')
dev.off()