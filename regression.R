# --------------------------------------------------------------
# Regression Analysis in R - How to visualise predict() function 
# --------------------------------------------------------------
# load libraries
library(mlbench)
library(gridExtra)
library(ggpubr)

# Visualise prediction with CI and PI
# 1. Build linear model 
data("cars", package = "datasets")
model <- lm(dist ~ speed, data = cars)

# 2. Add predictions 
pred.int <- predict(model, interval = "prediction")
mydata <- cbind(cars, pred.int)

# 3. Regression line + confidence intervals
library("ggplot2")
p1 <- ggplot(mydata, aes(speed, dist)) +
  geom_point() +
  stat_smooth(method = lm)

# 4. Add prediction intervals
p2 <- p1 + geom_line(aes(y = lwr), color = "red", linetype = "dashed")+
  geom_line(aes(y = upr), color = "red", linetype = "dashed")
# plot
grid.arrange(p1,p2, nrow=1)
