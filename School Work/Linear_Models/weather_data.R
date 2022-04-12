library(ggplot2)
library(gridExtra)
library(reshape2)

# reading and manipulating the data

weather = read.csv("C:\\Users\\Johan\\Documents\\6010Project\\2801622.csv")


# splitting the data into subsets based on location
weather.cedar = subset(weather,STATION=="USW00093129")
weather.provo = subset(weather,STATION=="USS0011J70S")
weather.uintah = subset(weather,STATION=="USS0010J30S")
weather.slc = subset(weather, STATION=="USW00024127")
weather.logan = subset(weather, STATION=="USC00421918")


# collect only the mean temperature into a single dataframe
cedar_temp = weather.cedar$TAVG
provo_temp = weather.provo$TAVG
uintah_temp = weather.uintah$TAVG
logan_temp = weather.logan$TAVG
slc_temp = weather.slc$TAVG

temperatures = data.frame(cedar_temp,provo_temp,uintah_temp,logan_temp,slc_temp)



# create exploratory plots

p1 = ggplot(temperatures,aes(cedar_temp,slc_temp))+
  geom_point()+
  geom_smooth(method='lm')

p2 = ggplot(temperatures,aes(provo_temp,slc_temp))+
  geom_point()+
  geom_smooth(method='lm')

p3 = ggplot(temperatures,aes(uintah_temp,slc_temp))+
  geom_point()+
  geom_smooth(method='lm')

p4 = ggplot(temperatures,aes(logan_temp,slc_temp))+
  geom_point()+
  geom_smooth(method='lm')

grid.arrange(p1,p2,p3,p4,nrow=2)



# create and analyze a linear model

fit = lm(slc_temp~cedar_temp+provo_temp+uintah_temp+logan_temp, data=temperatures)
summary(fit)

confint(fit,level=.99)

# alternate model where all variables are significant
fit1 = lm(slc_temp~cedar_temp+provo_temp+logan_temp, data=temperatures)
summary(fit1)

confint(fit1,level=.99)


# plot data

pred_temp = fitted(fit) # the predicted values

layout()
plot(fitted(fit1))
plot(residuals(fit1))

# fitted and observed data
pf = data.frame(index = c(1:182),slc_temp,pred_temp)
pf = melt(pf,id.var=1)
ggplot(data=pf, aes(index,value,color=variable))+
  geom_point(alpha=.5)+
  scale_color_manual(values=c("red","blue"))+
  labs(x="Index",y="Temperature")


# diagnostic plots
layout()
plot(fit)



  
  