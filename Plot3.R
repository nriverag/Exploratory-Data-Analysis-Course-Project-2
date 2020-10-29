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
# Plot 3
#Of the four types of sources indicated by the type 
#(point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008?
# Data handling
DataPlot3 <- NEI[NEI$fips=="24510",]
# Plot
png("plot3.png", width=480, height=480)
g <- ggplot(DataPlot3,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
print(g)
dev.off()
