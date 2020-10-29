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
# Plot 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
# Data handling
Combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
Coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
CombustionCoal <- (Combustion & Coal)
CombSCC <- SCC[CombustionCoal,]$SCC
DataPlot4 <- NEI[NEI$SCC %in% CombSCC,]
# Plot
png("plot4.png", width=480, height=480)
g <- ggplot(DataPlot4,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
print(g)
dev.off()
