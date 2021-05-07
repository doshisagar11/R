library(tibble)
library(openxlsx)
library(readr)
library(tidyverse)
library(stringr)
library(ggplot2)

#uploading the files
# s-sizmek and d-datorama
s <- read.csv("C:/Users/sagar.doshi/Desktop/R Automation/QA Automation Files/Sizmek Files/Ikea_Kitchens.csv",header = TRUE, skip = 27)
names(s)<- c("Day","Campaign.Name","SImpressions","SClicks","SSpend","SConversions")
s = subset(s,select = c(1:6))

d <- read.csv("C:/Users/sagar.doshi/Desktop/R Automation/QA Automation Files/Datorama Files/Kitchens 4.9-6.26.csv",header = TRUE, skip = 6)
names(d)<- c("Day","Campaign.Name","DImpressions","DClicks","DSpend","DConversions")

#merging two files into one
f <- cbind(s,d)
#removing unwanted columns
f <-f[,-7:-8]

str(f)

#removing comma's and converting to number
f$SImpressions<-as.numeric(gsub(",","",levels(f$SImpressions)))[f$SImpressions]
f$DImpressions<-as.numeric(gsub(",","",levels(f$DImpressions)))[f$DImpressions]
f$SClicks<-as.numeric(gsub(",","",levels(f$SClicks)))[f$SClicks]
f$DClicks<-as.numeric(gsub(",","",levels(f$DClicks)))[f$DClicks]
f$SSpend<-as.numeric(gsub(",","",levels(f$SSpend)))[f$SSpend]
f$DSpend<-as.numeric(gsub(",","",levels(f$DSpend)))[f$DSpend]
f$SConversions<-as.numeric(gsub(",","",levels(f$SConversions)))[f$SConversions]
f$DConversions<-as.numeric(gsub(",","",levels(f$DConversions)))[f$DConversions]

f$Day<-as.character(f$Day)
#Calculation
f<-add_column(f, Imp_Diff=f$SImpressions - f$DImpressions , .after = 10)
f<-add_column(f, Imp_PD= f$Imp_Diff / f$SImpressions *100, .after = 11)

f<-add_column(f, Clicks_Diff=f$SClicks - f$DClicks , .after = 12)
f<-add_column(f, Clicks_PD= f$Clicks_Diff / f$SClicks *100, .after = 13)

f<-add_column(f, Spend_Diff=f$SSpend - f$DSpend , .after = 14)
f<-add_column(f, Spend_PD= f$Spend_Diff / f$SSpend *100, .after = 15)

f<-add_column(f, Conversions_Diff=f$SConversions - f$DConversions , .after = 16)
f<-add_column(f, Conversions_PD= f$Conversions_Diff / f$SConversions *100, .after = 17)

sum(f$Imp_Diff)
sum(f$Clicks_Diff)
sum(f$Spend_Diff)
sum(f$Conversions_Diff)

mean(f$Imp_PD)
mean(f$Clicks_PD)
mean(f$Spend_PD)
mean(f$Conversions_PD)

write.xlsx(f,"C:/Users/sagar.doshi/Desktop/R Automation/QA Automation Files/Final Report/Final.xlsx")

ggplot(data = f, aes(x = factor(Day), y = as.numeric(Spend_PD))) +
  geom_point() + geom_line(aes(group=1))


