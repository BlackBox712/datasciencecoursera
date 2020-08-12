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
png("plot6.png")

# plot6
baltLosAngelesMotors <- subset(NEI, NEI$fips %in% c("24510","06037") & 
                                   NEI$type == "ON-ROAD")
baltLosAngelesMotorsAGG <- aggregate(Emissions ~ year + fips, baltLosAngelesMotors, sum)

ggplot(baltLosAngelesMotorsAGG, aes(year, Emissions, col = fips)) +
    geom_line() + geom_point() +
    ggtitle(expression("Baltimore and Los Angeles" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
    labs(x = "Year", y = expression(~PM[2.5]~ "Motor Vehicle Emissions") ) +
    scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
    theme(legend.title = element_text(face = "bold"))

dev.off()