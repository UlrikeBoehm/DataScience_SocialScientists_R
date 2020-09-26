## command examples
2 + 2
rep(1,100)

## create an object
my_object <- seq(from = 0, to = 50, by = 2)

## view the object
my_object

## plot the object 
plot(my_object)

## working directory
getwd()

# beware of backwards slashes!
setwd("C:/Users/Ulrike Boehm/Desktop")

getwd()

## Loading Data 

# Excel spreadsheet
install.packages("readxl")
library(readxl)

my_EXCELdata <- read_excel("my_exceldata.xlsx")

# .csv files
my_CSVdata <- read.csv("my_csvdata.csv")

# .dta files
install.packages("foreign")
library(foreign)

my_DTAdata <- read.dta("my_dtadata.dta")

# .sav files (SPSS)
install.packages("haven")
library(haven)

my_SPSSdata <- read.sav("my_spssdata.sav")

## Punctuation
rep(1.100)
rep(1,100)

my_object[1]
my_object[2]
my_object[3]

## Using help files
?sample
sample(c(0,1),100,replace = TRUE)
