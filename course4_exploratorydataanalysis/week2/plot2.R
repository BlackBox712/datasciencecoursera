library(ggplot2)
library(RColorBrewer)

# Load the data:
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

# Check NEI data
str(NEI)
# Check SCC data
str(SCC)

# Create png
png("plot2.png")

# plot2
baltimore <- subset(NEI, NEI$fips == "24510")
totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

plot(totalBaltimore$year, totalBaltimore$Emissions, type = "o", 
     main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"), 
     xlab = "Year", ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"), 
     col = "steelblue3")

dev.off()