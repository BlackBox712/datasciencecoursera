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
png("plot3.png")

# plot3
baltimore <- subset(NEI, NEI$fips == "24510")
baltimoreType <- aggregate(Emissions ~ year + type, baltimore, sum)

ggplot(baltimoreType, aes(year, Emissions, col = type)) +
    geom_line() + geom_point() +
    ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions by Type and Year")) +
    ylab(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions")) + xlab("Year") +
    scale_colour_discrete(name = "Type of sources") +
    theme(legend.title = element_text(face = "bold"))

dev.off()