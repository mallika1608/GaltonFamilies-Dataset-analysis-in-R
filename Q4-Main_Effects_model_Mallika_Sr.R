# install.packages("HistData",  repos = "http://cran.us.r-project.org", dependencies=TRUE)
library("HistData")
data(GaltonFamilies)
Galton2 <- data.frame(GaltonFamilies)

#1. Fit the main effects model g2: childHeight ~ gender + midparentHeight.

g2<-lm(childHeight ~ gender + midparentHeight,data=Galton2)


#2. Obtain the coefficients, standard error of estimate, t-value of estimate,
#and p-value of estimate for model g2.

(summary(g2)$coeff)

#3. Interpret the value of the coefficient for gender.

#Ans- The co-efficient value of gender is 5.21511 and it's p-value is very small indicating that 'gender' is significant in predicting 'childHeight'.
# Gender variable has two lables- Male & Female with reference level set at male 
# The value of gender coefficient in the model will depend on these two lables- Male & Female and numeric value assigned to them.
# For eg.- if male is assigned numeric value of 1, then it will lead to an increase of 5.21 inches in childHeight with every inch increase in Male
# however if gender is female and numeric value assigned is 0, then increase in ChildHeight will be equal to the value of other coefficient as gender-female will have 0 value




