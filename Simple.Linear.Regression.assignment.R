#Assignment: Single Linear Regression Models

###################################################################

#Question 1: Can concentration be used to predict rate? Create different higher orders to see what happens.
#Already created some lower order models in class. Now need to create higher order ones. 

###################################################################
attach(Puromycin)
head(Puromycin)
tail(Puromycin)
Puromycin

##EDA
##plot concentraion and rate
plot(conc, rate) #Doesn't look linear, but there is a relationship

#Check if normal
qqnorm(rate) #Looks okay

#Do a correlation test to see how linear the two variables are. 
cor.test(conc,rate) #Since p value is low there is some linear component of between conc and rate. 
#null hypotheis of no linear relationship was rejected so we proceed with a linear model


##Cubic model
fit3 <- lm(rate ~ conc + I(conc^2) + I(conc^3))
summary(fit3)

#All 3 predictors are significant
#R squared is .844
#F-statistic: 40.69 on 3 and 19 DF,  p-value: 1.813e-08


##Quartic model
fit4 <- lm(rate ~ conc + I(conc^2) + I(conc^3)+ I(conc^4))
summary(fit4)
#Only conc, conc^2, and conc^3 are signifcant
#R squared is .85
#F-statistic: 32.36 on 4 and 18 DF,  p-value: 5.364e-08

#Best model conclusion:
#I would recommend the model with conc, conc^2 and conc^3 model because 
#when I went to the quartic term model it didn't add a lot of value to
#my r^2, and it forced terms that were significant in previous models to not be significant. 

############################################################################

##Question 2: Use regression to determine whether wool brand (A or B) can be used to predict the variable breaks. 
#Use a dummy variable for wool. 

############################################################################

attach(warpbreaks)
head(warpbreaks)
tail(warpbreaks)


##Since Wool is a non-quanative variable. #Need to use dummy variable
X <- ifelse(wool == "A", 1,0)
X


#EDA 
plot(X,breaks) #Kind of looks like wool B breaks is higher

#Create Model
fit.w <- lm(breaks ~ X)
summary(fit.w) ##pvalue is .108, so we can't reject null that wool type affects breaks. 

#Residuals
fitted <- predict(fit.w)
resid <- residuals(fit.w)

#Check normality of residuals
qqnorm(resid) ##Kind of looks normal

#Res vs independent variable 
plot(X,resid)


#Res vs dependent variable
plot(breaks,resid)

#Check non-constant variances
plot(fitted, resid)

#Conclusion:
#Noticed that Wool brand was a categorical variable, which means I needed to create a dummy variable. 
#After doing that I created a model with breaks as the response variable and wool brand as the predictor variable.
#The pvalue for wool brand was .108, which is not considered significant. 
#This means that we use wool as a predictor for breaks. 

############################################################################

#Question 3: Use regression to determine whether Height can be used to predict Volume. 
#A transformation like log() or sqrt() can be helpful to improve normality.  

############################################################################
attach(trees)

##EDA
head(trees)
tail(trees)
trees

shapiro.test(Height) #pvalue is .4, Normal
shapiro.test(Volume) #pvalue is .003, Not normal

plot(Height, Volume) #Looks like there is a relationship between the 2 variables

fit <- lm(Volume ~ Height)
summary(fit) ## pvalue is significant and r squared is just .3579

#Residual Analysis
fitted <- predict(fit)
resid <- residuals(fit)

plot(Height, resid) #Looks good, but might be some outliers. Since has some extreme values
plot(Volume, resid) #It doesn't look randomized. Could be because of crazy outliers 
plot(fitted, resid) #Looks good kind fo funnel shaped. 


##Try a transformation
fit2 <- lm(sqrt(Volume) ~ Height)  ##pvalue is significan and the r squared is better than before at .3908
summary(fit2)

#Residuals analysis
fitted <- predict(fit2)
resid <- residuals(fit2)

plot(Height, resid) #Looks really good with no pattern
plot(sqrt(Volume), resid)  
plot(fitted, resid) #Looks good, no pattern and especially no funnel shape. 

#Conclusion:
#Tested to see if height and volume were normally distributed with Shapiro test. 
#Found that height was and volume was not. Created a model with Volume as response and height as predictor. 
#P value was really low. (about .0003) and the R squared was .3348. 
#The F test also had a low p value, which means height is a good metric to use to predict a tree's volume.
#The residual analysis for this told me I should try a transformation like the question suggested. 
#I chose to transform the model by taking the sqrt of the predictor value volume. 
#What I got was again a low p value for Height, a better R squared of .3698, and a low value for F test again. 
#The best part about this transformation was that the residual analysis plots looked a lot better. 


