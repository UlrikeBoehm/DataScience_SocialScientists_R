#Generating histdata_twoyears
histdata_twoyears <- select(teenager_fr, Country.Name, Country.Code, Indicator.Name, Indicator.Code, X1960,X2000)

histdata_twoyears <- gather(teenager_fr, Year, FertilityRate, X1960, X2000) %>%
select(Year, Country.Name, Country.Code, FertilityRate)

histdata_twoyears <- filter(histdata_twoyears,!is.na(FertilityRate))

histdata_twoyears

ggplot(histdata_twoyears, aes(x=FertilityRate)) + 
  geom_histogram(data=subset(histdata_twoyears, Year=="X1960"), 
                 color="darkred", fill="red", alpha=0.2) + 
  geom_histogram(data=subset(histdata_twoyears, Year=="X2000"), 
                   color="darkblue", fill="blue", alpha=0.2) 
ggsave("hist.png")

#Question 20
ggplot(histdata_twoyears, aes(x=FertilityRate, group=Year, color=Year, alpha=0.2)) +
  geom_histogram(aes(y=..density..)) +
  geom_density(data=subset(histdata_twoyears, Year=="X1960"), color="darkred", fill="red", alpha=0.2, bw=5)+ 
  geom_density(data=subset(histdata_twoyears, Year=="X2000"), color="darkblue", fill="blue", alpha=0.2, bw=5)


# Question 22
ggplot(histdata_twoyears, aes(x=FertilityRate)) +
  stat_ecdf(data=subset(histdata_twoyears, Year=="X1960"),color="darkblue") +
  stat_ecdf(data=subset(histdata_twoyears, Year=="X2000"),color="red")

p = seq(0,1,length=100)

X1 = 6/5*(1/2 + p^2) # X is a sample of 100 normally distributed random variables
z1 = ecdf(X1)    # P is a function giving the empirical CDF of X
z1(0.0)    # This returns the empirical CDF at zero (should be close to 0.5)

plot(z1) 

X2 = 6/5*(p + 1/3) # X is a sample of 100 normally distributed random variables
z2 = ecdf(X2)    # P is a function giving the empirical CDF of X
z2(0.0)         # This returns the empirical CDF at zero (should be close to 0.5)

plot(z2)        # Draws a plot of the empirical CDF (see below) 

# HW: Question 11 / part 2
plot(z1,col="red")
lines(z2,col="green")

ggplot(p,aes(x=FertilityRate)) +
  stat_ecdf(X1,color="darkblue") +
  stat_ecdf(X2,color="red")

x  <- seq(-2, 2, 0.05)
y1 <- pnorm(x)
y2 <- pnorm(x, 1, 1)
plot(x, y1, type = "l", col = "red")
plot(x, y2, type = "l", col = "green")

plot(x,y1,type="l",col="red")
lines(x,y2,col="green")
