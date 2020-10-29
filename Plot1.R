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
# Plot 1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Data handling
DataPlot1 <- aggregate(Emissions ~ year,NEI, sum)
#Plot
png("plot1.png", width=480, height=480)
barplot(DataPlot1$Emissions/10^6, names.arg=DataPlot1$year,
        xlab="Year", ylab="PM2.5 Emissions (millions of tons)",
        main="Total PM2.5 Emissions From All US Sources", 
        col=c("yellow", "brown", "blue", "red"), ylim=c(0,8))
dev.off()
