library(ggplot2)

lung_data <- read.csv("/Users/maggie/Documents/Bioinfo/R_lab_1/lungDisease.csv", header = T, stringsAsFactors = F)

lung_data$has_disease <- 0

lung_data$has_disease <- ifelse(lung_data$rvtlc >=35, 1,0)

summary(lung_data)

# Univaraite

#urvtlc
ggplot(lung_data, aes(x=rvtlc)) + geom_histogram(col = 1, bin = 30)

#has_disease
ggplot(lung_data, aes(x=has_disease)) + geom_bar(col = 1)

#yrs_tot_smoke
ggplot(lung_data, aes(x=yrs_tot_smoke)) +  geom_density(fill = "sky blue")

#yrs_smoke
ggplot(lung_data, aes(x=yrs_smoke)) + geom_density(fill = "sky blue")

#age
ggplot(lung_data, aes(x=age)) + geom_density(fill = "sky blue")

#Bivariate
# rvtlc & yrs_tot_smoke
ggplot(lung_data, aes(x=yrs_tot_smoke,y = rvtlc)) + geom_point(col = "dark green")
# The plot does not show a relationship between yrs_tot_smoke & rvtlc

# rvtlc & yrs_smoke
ggplot(lung_data, aes(x=yrs_smoke,y = rvtlc)) + geom_point(col = "dark green")
# The plot does not show a relationship between yrs_tot_smoke & rvtlc

#rvtlc & age
ggplot(lung_data, aes(x=age,y = rvtlc)) + geom_point(col = "dark green")
# The plot shows that patients with elder age has higher rvtlc value, which indicates the problem could be chronic.

#rvtlc & has_disease
ggplot(lung_data, aes(x=rvtlc,fill=as.factor(lung_data$has_disease))) + geom_histogram(position="dodge")
#The plot shows that patients who have the disease have a rvtlc value larger than 35

# yrs_tot_smoke & yrs_smoke
ggplot(lung_data, aes(x=yrs_tot_smoke,y = yrs_smoke)) + geom_point(col = "dark green")
# The plot shows yrs_tot_smoke & yrs_smoke are positive realted.

#yrs_tot_smoke & age
ggplot(lung_data, aes(x=age,y = yrs_tot_smoke)) + geom_point(col = "dark green")
#The plot shows patient who has elder age tend to have longer yrs_toto_smoke

#yrs_tot_smoke & has_disease
ggplot(lung_data, aes(x=yrs_tot_smoke,fill=as.factor(lung_data$has_disease))) + geom_histogram(position="dodge")
# THe plot does not show obvious relationship between yrs_tot_smoke and has_disease


