# Single.Linear.Regression

## Objective
Question 1: Can concentration be used to predict rate? Create different higher orders to see what happens.
Already created some lower order models in class. Now need to create higher order ones. 

Question 2: Use regression to determine whether wool brand (A or B) can be used to predict the variable breaks. 
Use a dummy variable for wool. 

Question 3: Use regression to determine whether Height can be used to predict Volume. 
A transformation like log() or sqrt() can be helpful to improve normality.  

## Summary
Question 1:Did an EDA on data to check for normality, correlation, and distribution. Then created cubic and quartic models to see how they effect R squared and the F-Test Statistic. Then chose the "best" model

Question 2: Did an EDA on the data and created a dummy variable for the column wool. Then created a model with breaks as response and wool as predictor variable. Did did a residual analysis to evaluate the model. 

Question 3: Did an EDA on the data to check for normality, correlation, and distribution. Then created a model with Volume as response and Height as predictor. Looked at residuals analysis and found out I should transform the data. So I sqrt the response variable (Volumne) and made the model again. This time the residuals analysis was much better

## Conclusion
Question 1:
I would recommend the model with conc, conc^2 and conc^3 model because when I went to the quartic term model it didn't add a lot of value to my r^2, and it forced terms that were significant in previous models to not be significant. 

Question 2:
Noticed that Wool brand was a categorical variable, which means I needed to create a dummy variable.  After doing that I created a model with breaks as the response variable and wool brand as the predictor variable. The pvalue for wool brand was .108, which is not considered significant. This means that we use wool as a predictor for breaks. 

Question 3:
Tested to see if height and volume were normally distributed with Shapiro test. Found that height was and volume was not. Created a model with Volume as response and height as predictor. P value was really low. (about .0003) and the R squared was .3348.  The F test also had a low p value, which means height is a good metric to use to predict a tree's volume. The residual analysis for this told me I should try a transformation like the question suggested. I chose to transform the model by taking the sqrt of the predictor value volume. What I got was again a low p value for Height, a better R squared of .3698, and a low value for F test again. The best part about this transformation was that the residual analysis plots looked a lot better. 
