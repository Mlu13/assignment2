#1
lung_data <- read.csv("/Users/maggie/Documents/Bioinfo/R_lab_1/lungDisease.csv", header = T, stringsAsFactors = F)

#2
fit_main <- lm(rvtlc~yrs_tot_smoke + yrs_smoke + age, data = lung_data)
summary(fit_main)
# yrs_tot_smoke and age are positive coefficient so that they have a positive relationship with rvtlc
# yrs_smoke has negative coefficient indicating a negative relationship with rvtlc
# The adjusted R-square equals 0.49 which indicates a low goodness of fit since the higher the better fit.
# p-value: < 2.2e-16 shows that there is a significant relationship between response variable and predictor variable
# For one unit increases in yrs_tot_smoke, rvtlc increases 0.05 on average while other variable are held constant
# For one unit decreses in yrs_smoke, rvtlc decreases 0.05 on average while other variable are held constant
# For one unit increases in age, rvtlc increases 0.42 on average while other variable are held constant

#3
fit_smoke <- lm(rvtlc~yrs_smoke, data = lung_data)
summary(fit_smoke)
# In fit_main, yrs_smoke is not significant to rvtlc. However, in fit_smoke, yrs_smoke is significant to rvtlc

#4
fit_full <- lm(rvtlc ~ (yrs_tot_smoke + yrs_smoke + age)^2, data = lung_data)
summary(fit_full)
# Some new variables are significant to the rvtlc, for instance yrs_tot-smoke:yrs_smoke

#5
#remove yrs_tot_smoke
fit_full <- lm(rvtlc ~ (yrs_smoke + age)^2, data = lung_data)
summary(fit_full)
# For one unit decrease in yrs_smoke, rvtlc decreases 0.001 on average while other varaible are constant
# For one unit decrease in age, rvtlc increases 0.41 on average while other varaible are constant
# For one unit decrease in yrs_smoke:age, rvtlc increases 0.0001 on average while other varaible are constant

#6
lung_data$has_disease <- 0

lung_data$has_disease <- ifelse(lung_data$rvtlc >=35, 1,0)

#7
library(ggplot2)

ggplot(lung_data, aes(x=rvtlc,fill=as.factor(lung_data$has_disease))) + geom_histogram(position="dodge")
# Histogram shows that patient whose rvtlc >= 35 has COPD
ggplot(lung_data, aes(x=yrs_tot_smoke,fill=as.factor(lung_data$has_disease))) + geom_histogram(position="dodge")
# Histogram shows the number of patient with or without COPD realted to yrs_tot_smoke
ggplot(lung_data, aes(x=yrs_smoke,fill=as.factor(lung_data$has_disease))) + geom_histogram(position="dodge")
# Histogram shows the number of patient with or without COPD realted to yrs_smoke
ggplot(lung_data, aes(x=age,fill=as.factor(lung_data$has_disease))) + geom_histogram(position="dodge")
# Histogram shows that elder people have greater chance to get COPD than youger people.

#8
log_model <- glm(has_disease ~ yrs_tot_smoke + yrs_smoke + age, family=binomial(), data=lung_data)
summary(log_model)
# In both cases, age is the most significant predictive variable to response variable.

#9
newmodel <- step( lm(rvtlc ~ (yrs_tot_smoke + yrs_smoke + age)^2, data = lung_data))
summary(newmodel)

#10
new_log_model <- glm(has_disease ~ rvtlc, family=binomial(), data=lung_data)
summary(new_log_model)
# The results show rvtlc is insignificant to has_disease since the p-value for rvtlc = 0.988
