Welcome to Data Analysis for R repository!

Here is collection of R scripts that might be useful during R programming. I hope you will find these lines useful for your personal or work purposes!

Data mining script, which finds all patterns and select the most optimal regression model for data frame:
```
reg.data.mining(rus.bubble.df.new)
```
Output:
```
$Income

Call:
lm(formula = r, data = d)

Residuals:
    Min      1Q  Median      3Q     Max 
-598.68 -133.95  -71.87    8.54 1057.72 

Coefficients:
                    Estimate Std. Error t value Pr(>|t|)   
(Intercept)        1.979e+03  9.771e+02   2.025  0.04658 * 
`Fertility Rate`   3.434e+02  1.122e+02   3.061  0.00312 **
`Life Expectancy` -2.752e+01  1.436e+01  -1.916  0.05936 . 
Population         3.265e-05  1.726e-05   1.892  0.06262 . 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 268.6 on 71 degrees of freedom
Multiple R-squared:  0.1485,	Adjusted R-squared:  0.1125 
F-statistic: 4.127 on 3 and 71 DF,  p-value: 0.009348


$`Life Expectancy`

Call:
lm(formula = r, data = d)

Residuals:
    Min      1Q  Median      3Q     Max 
-4.2582 -1.0659 -0.3150  0.7114 10.2786 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)       6.727e+01  1.364e+00  49.307  < 2e-16 ***
`Fertility Rate`  1.910e+00  9.348e-01   2.043  0.04478 *  
Income           -1.787e-03  9.326e-04  -1.916  0.05936 .  
Population        4.081e-07  1.341e-07   3.044  0.00327 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.164 on 71 degrees of freedom
Multiple R-squared:  0.1526,	Adjusted R-squared:  0.1168 
F-statistic: 4.262 on 3 and 71 DF,  p-value: 0.00796


$Population

Call:
lm(formula = r, data = d)

Residuals:
     Min       1Q   Median       3Q      Max 
-3344249  -838458  -384872   483328  8958553 

Coefficients:
                    Estimate Std. Error t value Pr(>|t|)   
(Intercept)       -1.662e+07  6.448e+06  -2.578  0.01202 * 
`Fertility Rate`  -1.587e+06  7.784e+05  -2.039  0.04520 * 
`Life Expectancy`  2.829e+05  9.293e+04   3.044  0.00327 **
Income             1.470e+03  7.769e+02   1.892  0.06262 . 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1802000 on 71 degrees of freedom
Multiple R-squared:  0.1517,	Adjusted R-squared:  0.1158 
F-statistic: 4.231 on 3 and 71 DF,  p-value: 0.008257


$`Fertility Rate`

Call:
lm(formula = r, data = d)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.58448 -0.17115 -0.00993  0.09541  1.27489 

Coefficients:
                    Estimate Std. Error t value Pr(>|t|)   
(Intercept)       -7.272e-01  9.955e-01  -0.730  0.46750   
`Life Expectancy`  2.907e-02  1.423e-02   2.043  0.04478 * 
Income             3.395e-04  1.109e-04   3.061  0.00312 **
Population        -3.485e-08  1.709e-08  -2.039  0.04520 * 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.267 on 71 degrees of freedom
Multiple R-squared:  0.1578,	Adjusted R-squared:  0.1223 
F-statistic: 4.436 on 3 and 71 DF,  p-value: 0.00648
```
