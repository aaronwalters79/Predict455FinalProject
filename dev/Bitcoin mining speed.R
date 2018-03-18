#Verified Python 3.3.3


setwd("~/Dropbox/NorthWestern/Predict 455 - Winter 2018/Predict455FinalProject/indata")

df2 <- read.csv(file="bitcoinity_data.csv", head=TRUE, colClasses=c("Time"="Date"))

###################

library(ggplot2)
library(readxl)
library(gridExtra)
library(reshape2)
library(readr)
#Load Data



setwd("~/Dropbox/NorthWestern/Predict 455 - Winter 2018/Predict455FinalProject/indata")
df2 <- read_csv("bitcoinity_data.csv", 
                            col_types = cols(Date = col_date(format = "%Y-%m-%d")))
View(bitcoinity_data)

df3 = melt(df2, id.vars=c("Date"), value.name='Hash Rate Per Second')
names(df3) <- c("Date", "Pool Name",'Hash Rate / Second')

p1 = ggplot(data=df3, aes(x=Date, y=df3$`Hash Rate / Second`, group=df3$`Pool Name`))+
  geom_line(aes(color=df3$`Pool Name`)) + 
  ylab('Hash Rate Per Second') + 
  xlab('Year') + 
  labs(color='Miner Pool') + 
  theme(panel.background = element_blank())   

p1



p1 = p1+ggtitle("Production/ Mining Speed, 16 Competitors")

p1
grid.text("", x = unit(0.95, "npc"), y = unit(0.65, "npc"))

