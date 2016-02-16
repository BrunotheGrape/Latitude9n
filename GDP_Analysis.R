#GDP Analysis

library(dplyr); library(ggplot2)
Data <- read.csv("World_Bank_GDP.csv",header = TRUE)
View(Data)

# subsetting the data for China, Chile, and Peru and the 10 year period 2004 through 2014
GData <- Data %>% filter(Country.Code %in% c("CHN","CHL","PER")) %>% select(Country.Code,X2004:X2014)

TData <- t(GData) #converting columns to rows for the linear analysis
colnames(TData) <- TData[1,] #naming the columns based on the first row
TData <- TData[-1,] #removing the first row which is factor leaving GDP values
dfData <- as.data.frame(TData)  #converting to a dataframe for ggplot
dfData$CHN <- as.numeric(dfData$CHN)# converting factor variables to numerics
dfData$CHL <- as.numeric(dfData$CHL)
dfData$PER <- as.numeric(dfData$PER)

#Chile as predicted by China GDP
p <- ggplot(dfData, aes(x=CHN,y=CHL)) 
p <- p + geom_point(colour = "black", size = 5)
p <- p + geom_point(colour = "salmon", size = 4)
p <- p + geom_smooth(method="lm", col = "forestgreen", lwd = 2)
p <- p + xlab("China GDP") + ylab("Chile GDP") + ggtitle("Chile GDP Correlated With China GDP\n2004 through 2014")
ggsave(file = "China_Peru.png")


#Chile as predicted by China GDP
p <- ggplot(dfData, aes(x=CHN,y=PER)) 
p <- p + geom_point(colour = "black", size = 5)
p <- p + geom_point(colour = "lightblue", size = 4) 
p <- p + geom_smooth(method="lm", col = "forestgreen", lwd = 2)
p <- p + xlab("China GDP") + ylab("Peru GDP") + ggtitle("Peru GDP Correlated With China GDP\n2004 through 2014")
ggsave(file = "China_Chile.png")



