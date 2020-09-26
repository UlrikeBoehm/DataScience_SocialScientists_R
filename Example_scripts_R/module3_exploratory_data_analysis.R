# set the library with the packages we use
library(gglot2)
library(tidyverse)
library(cowplot) # for grids 

# load in the data
bihar_data <- read_csv("data/Bihar_sample_data.csv")

# have a look
print(bihar_data)

# keep only females
bihar_adult_females <- filter(bihar_data, adult==1, female==1)

# have a look 
print(bihar_adult_females)

# default histogram in ggplot
ggplot(bihar_adult_females, aes(height_cm)) + geom_histogram()
ggsave("output/bihar_raw.pdf")

# some people lok like they are very small / large 
bihar_adult_females_trunc <- filter(bihar_adult_females, height_cm>120, height_cm<200)

# Plotting again, with a nicer label, and some color
ggplot(bihar_adult_females_trunc, aes(height_cm)) +
  geom_histogram(fill="blue", color="darkblue", aes(height_cm, ..density..)) +
  geom_density(kernel="gaussian",aes(height_cm)) +
  xlab("Height in centimeters, Bihar Females")
ggsave("output/bihar_better.pdf")
