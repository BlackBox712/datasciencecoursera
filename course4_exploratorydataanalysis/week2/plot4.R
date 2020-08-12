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
png("plot4.png")

# plot4
SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC,]
totalCoal <- aggregate(Emissions ~ year + type, NEIcoal, sum)

ggplot(totalCoal, aes(year, Emissions, col = type)) +
    geom_line() + geom_point() +
    ggtitle(expression("Total US" ~ PM[2.5] ~ "Coal Emission by Type and Year")) +
    xlab("Year") + ylab(expression("US " ~ PM[2.5] ~ "Coal Emission")) +
    scale_colour_discrete(name = "Type of sources") +
    theme(legend.title = element_text(face = "bold"))

dev.off()