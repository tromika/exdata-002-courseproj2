datafile1 <- "data/summarySCC_PM25.rds"
datafile2 <- "data/Source_Classification_Code.rds"
downloadfile <-"data/exdata-data-NEI_data.zip"

#Download file if not exists, unzip it
if ( !exists('NEI') && !exists('SCC') ) {
  if (!file.exists(datafile1)&&!file.exists(datafile2)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(fileURL, downloadfile, method="curl")
    unzip(downloadfile)     
  } 
  #Read data files
  ## This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("data/summarySCC_PM25.rds")
  SCC <- readRDS("data/Source_Classification_Code.rds")
}