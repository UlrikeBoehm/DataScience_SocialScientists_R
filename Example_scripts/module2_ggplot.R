library(ggplot2)
cars
myData <- cars
ggplot(myData,aes(x=speed,y=dist))
ggplot(myData,aes(x=speed,y=dist)) + geom_point()
g <- ggplot(myData,aes(x=speed,y=dist)) + geom_point()
g
gg <- g + coord_cartesian(xlim=c(10,15),ylim=c(25,50))
gg

mtcars
myData <- mtcars

ggplot(myData, aes(x=wt)) + geom_histogram()
ggplot(myData, aes(x=wt)) + geom_histogram(binwidth = 0.5)
h <- ggplot(myData, aes(x=wt)) + 
  geom_histogram(binwidth = 0.5, color="black",fill="white")
h + geom_vline(aes(xintercept=mean(wt)),color="red",linetype='dashed',size=1)
mean(myData$wt)

ggplot(myData,aes(x=wt))  +
         geom_histogram(binwidth=0.5,aes(y= ..density..),
                         alpha=0.3,color="black",fill="white") +
         geom_density(alpha=0.2,fill="red")
       
       