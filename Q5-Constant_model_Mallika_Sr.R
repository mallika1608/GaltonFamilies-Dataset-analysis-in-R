
# install.packages("HistData",  repos = "http://cran.us.r-project.org", dependencies=TRUE) 
library("HistData")
data(GaltonFamilies)
Galton2 <- data.frame(GaltonFamilies)

#1. Fit the constant model g0: childHeight ~ 1

g0<-lm( childHeight~1,  Galton2)

#2. Obtain the coefficients, standard error of estimate, t-value of estimate, and p-value of estimate for model g0.

(summary(g0)$coeff)

#3. Interpret the value of the coefficient.

#Ans- Here since we have no variable, we are only interpreting the 'Intercept'. 
# p-value is '0' which is high indicating that 'Intercept' is not very significant in predicting 'ChildHeight'
# Also when all other variables are 'zero', value of childheight is- 66.7459 (equal to the value of the intercept).
# On looking up, this value is also same as the mean of 'childheight' shown below-

summary(Galton2$childHeight)


