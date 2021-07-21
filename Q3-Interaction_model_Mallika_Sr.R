
#rm(list=ls())

#install.packages("HistData",  repos = "http://cran.us.r-project.org", dependencies=TRUE)

library("HistData")
library(GGally)

data(GaltonFamilies)
Galton2 <- data.frame(GaltonFamilies)



#1. Fit an the interaction model g1: childHeight ~ gender + midparentHeight + gender:midparentHeight

g1<-lm(childHeight ~ gender + midparentHeight + gender:midparentHeight, data = Galton2)


#2. Using title "Residual Plot", obtain the scatterplot of the residuals vs fitted values. Don't print it, save it in p1.

p1<-ggplot(g1, aes(.fitted, .resid)) +
  geom_point() +
  geom_hline(yintercept=0, color="Green", linetype="dashed") +
  ggtitle("Residual Plot")

 

#3. Using title "Residual Plot", obtain the scatterplot of the residuals vs midparentHeight. Don't print it, save it in p2

p2<-ggplot(g1, aes(midparentHeight, .resid,)) +
  geom_point() +
  ggtitle("Residual Plot", labs(x="midparentHeight", y="Resid"))


#4. Using title "Boxplot", obtain the boxplot of the residuals vs gender. Don't print it, save it in p3

p3<-ggplot(g1,aes(gender, .resid)) +
  geom_boxplot(color="dark blue", fill='lightyellow',linetype="dashed")+ggtitle("Boxplot")


#5. Using title "QQ-plot", obtain the QQ-plot, with a red qq-line, of the residuals. Don't print it, save it in p4


p4<-ggplot(g1) + 
  aes(sample = g1$residuals) +
  geom_qq() +
  geom_qq_line(color="red")+
  labs(title="QQ-Plot",y="Residuals")


#6. Using a 2x2 grid, plot all four plots using gridExtra.

gridExtra::grid.arrange(p1, p2, p3, p4,nrow=2)

#7. What patterns do the above plots reveal if any?

# Two distinct clusters of data points in the residual vs fitted plot.
# Residuals vs 'MidparentHeight' plot shows concentrations of points around the axis and several outliers
# Boxplot shows male having higher mean than female and both box plots have outliers
# QQ plot has three distinct outliers
# The model needs improvement may be because its getting effected by the gender variables



#8. Obtain the coefficients, standard error of estimate, t-value of estimate, 
#and p-value of estimate for model g1.


summary(g1)$coefficients





