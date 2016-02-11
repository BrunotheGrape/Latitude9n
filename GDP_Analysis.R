#GDP Analysis

library(dplyr); library(ggplot2)
Data <- read.csv("World_Bank_GDP.csv",header = TRUE)
View(Data)


GData <- Data %>% filter(Country.Code %in% c("CHN","CHL","PER")) %>% select(Country.Code,X2004:X2014)

TData <- t(GData)
colnames(TData) <- TData[1,]
TData <- TData[-1,]
dfData <- as.data.frame(TData)

p <- ggplot(dfData, aes(x=CHN,y=CHL)) 
p <- p + geom_point(colour = "darkblue", size = 4)
p <- p + xlab("China") + ylab("Chile")
        
p
