# Preliminaries

rm(list=ls())
library(utils)
library(tidyverse)  

# Getting
gender_data <- as_tibble(read.csv("data/Gender_StatsData.csv"))
print(gender_data)
head(gender_data)
tail(gender_data)

# Filter 
teenager_fr <- filter(gender_data, Indicator.Code == "SP.ADO.TFRT")
teenager_fr

rm(gender_data)

mean(teenager_fr$X1975, na.rm = TRUE)
?mean

tail(teenager_fr)

mean(teenager_fr$X1960, na.rm = TRUE)
sd(teenager_fr$X1960, na.rm = TRUE)

mean(teenager_fr$X2000, na.rm = TRUE)
sd(teenager_fr$X2000, na.rm = TRUE)

byincomelevel <- filter(teenager_fr,Country.Code%in%c("LIC","MIC","HIC","WLD"))
byincomelevel
head(byincomelevel)


colnames(byincomelevel)[1] <- "Country.Name2" # 2 needed to avoid naming confusion

plotdata_bygroupyear <- gather(byincomelevel, Year, FertilityRate, X1960:X2015)  %>%
  select(Year, Country.Name, Country.Code,FertilityRate)
plotdata_bygroupyear

# Question 11
plotdata_byyear <- select(plotdata_bygroupyear, Country.Code, Year, FertilityRate) %>%
  spread(Country.Code,FertilityRate)
plotdata_byyear

# Question 13
ggplot(plotdata_bygroupyear,aes(x=Year,y=FertilityRate, group=Country.Code,color=Country.Code)) +
  geom_line() +
  labs(title='Fertility Rate by Country-Income-Level over Time')

# Question 16
library(stringr)
plotdata_bygroupyear <- mutate(plotdata_bygroupyear, Year=as.numeric(str_replace(Year,"X","")))

ggplot(plotdata_bygroupyear,aes(x=Year,y=FertilityRate, group=Country.Code,color=Country.Code)) +
  geom_line() +
  labs(title='Fertility Rate by Country-Income-Level over Time')

