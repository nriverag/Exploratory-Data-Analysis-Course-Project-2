rm(list = ls())
library(ggplot2)
# Directory
getwd()
setwd("C:/Users/Nicolás Rivera/OneDrive/Documentos/Data Science Johns Hopkins University/Exploratory Data Analysis/Semana 4")
# Webimport and read data files 
# Webimport
filewebsite<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(filewebsite,destfile="Data.zip",method="auto") 
unzip("Data.zip")
# Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Plot 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Data handling
Baltimore <- NEI[NEI$fips=="24510",]
DataPlot2 <- aggregate(Emissions ~ year, Baltimore,sum)
# Plot
png("plot2.png", width=480, height=480)
barplot(DataPlot2$Emissions, names.arg=DataPlot2$year,
        xlab="Year",  ylab="PM2.5 Emissions (Tons)",
        main="Total PM2.5 Emissions From all Baltimore City Sources",
        col=c("yellow", "brown", "blue", "red"), ylim = c(0,4000))
dev.off()
