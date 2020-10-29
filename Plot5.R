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
# Plot 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
# Data handling
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
DataPlot5 <- vehiclesNEI[vehiclesNEI$fips=="24510",]
# Plot
png("plot5.png", width=480, height=480)
g <- ggplot(DataPlot5,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
print(g)
dev.off()
