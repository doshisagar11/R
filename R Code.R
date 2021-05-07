library(bindr)
library(bindrcpp)
library(dplyr)
library(forecast)
library(ggplot2)
library(lazyeval)
library(plotly)
library(plyr)
library(scales)
library(shiny)
library(tibble)
library(tidyr)
library(tidyselect)
library(timeDate)
library(xtable)

getwd()
setwd("C:/Users/sagar.doshi/Desktop/R Automation")
R<-read.csv("C:/Users/sagar.doshi/Desktop/R Automation/Registry Display Data.csv",header = TRUE)

R<- data.frame(R)
#addoing column
R$Audience<-NA

#dropping Column
R$Audience<-NULL

#Mapping
R$Audience <- NA
R$Audience[R$Sub.Targeting.Tactic == "PARENTS"] <- 'Baby'
R$Audience[R$Sub.Targeting.Tactic == "WEDDING"] <- 'Bridal'
R$Audience[R$Media.Buy.Name == "PJJB4K_IKE_REG_003_Audience_XAXIS_GL_XAX_D_BAN_CPMV_RTG_SITE_STANBAN_ENG_V_Run of Network_Retarget_P18-49_160 x 600_Standard_NV_NA"] <- 'Bridal'
R$Audience[R$Media.Buy.Name == "PJJB6P_IKE_REG_003_Audience_XAXIS_GL_XAX_D_BAN_CPMV_LAL_SITE_STANBAN_ENG_V_Run of Network_Other_P18-49_728 x 90_Standard_NV_NA"] <- 'Bridal'
R$Audience[R$Media.Buy.Name == "PJJB6J_IKE_REG_003_Audience_XAXIS_GL_XAX_D_BAN_CPMV_LAL_SITE_STANBAN_ENG_V_Run of Network_Other_P18-49_160 x 600_Standard_NV_NA"] <- 'Baby'
R$Audience[R$Media.Buy.Name == "PJJB4D_IKE_REG_003_Audience_XAXIS_GL_XAX_D_BAN_CPMV_RTG_SITE_STANBAN_ENG_V_Run of Network_Retarget_P18-49_300 x 250_Standard_NV_NA"] <- 'Baby'
R$Audience[R$Media.Buy.Name == "PJJB5C_IKE_REG_003_Audience_XAXIS_GL_XAX_D_BAN_CPMV_LAL_SITE_STANBAN_ENG_V_Run of Network_Other_P18-49_300 x 250_Standard_NV_NA"] <- 'Bridal'
R$Audience[R$Media.Buy.Name == "PJJB4R_IKE_REG_003_Audience_XAXIS_GL_XAX_D_BAN_CPMV_RTG_SITE_STANBAN_ENG_V_Run of Network_Retarget_P18-49_728 x 90_Standard_NV_NA"] <- 'Baby'
R$Audience[R$Media.Buy.Name == "PJJB6F_IKE_REG_003_Audience_XAXIS_GL_XAX_D_BAN_CPMV_LAL_SITE_STANBAN_ENG_V_Run of Network_Other_P18-49_300 x 600_Standard_NV_NA"] <- 'NA'
R$Audience[R$Media.Buy.Name == "PJJB4F_IKE_REG_003_Audience_XAXIS_GL_XAX_D_BAN_CPMV_RTG_SITE_STANBAN_ENG_V_Run of Network_Retarget_P18-49_300 x 600_Standard_NV_NA"] <- 'NA'

save.image()

#Mapping the missing values to Zero
R$Impressions <- sub("^$", 0, R$Impressions)

  #R$Impressions <- sub(NA, 0, R$Impressions)
R$In.View.Impressions <- sub("^$", 0, R$In.View.Impressions)

str(R)
# Convert all the metrices to numeric before importing it into R
R$Targeting.Tactic.FY18 <- as.character(R$Targeting.Tactic.FY18)
R$Targeting.Tactic.FY18 <- as.vector(R$Targeting.Tactic.FY18)
R$Planned.Spend.Creative.Daily.NK <- as.numeric(R$Planned.Spend.Creative.Daily.NK)
R$In.View.Impressions <- as.integer(R$In.View.Impressions)

library(sqldf)

sqldf('SELECT "Targetic.Tactic.FY18","Prisma.Site", Sum(Impressions), Sum(Clicks), Sum("Planned.Spend.Creative.Daily.NK") FROM R GROUP BY "Targetic.Tactic.FY18","Prisma.Site"')

sqldf('select Sum("Planned.Spend.Creative.Daily.NK") from R where "Prisma.Site" ="THE KNOT"')

sqldf('SELECT "Targetic.Tactic.FY18", Sum(Impressions), Sum(Clicks), Sum("Planned.Spend.Creative.Daily.NK") FROM R GROUP BY "Targetic.Tactic.FY18" ')

sqldf('SELECT Audience, Sum(Impressions), Sum(Clicks), Sum("Planned.Spend.Creative.Daily.NK") FROM R GROUP BY Audience ')

sqldf('SELECT distinct "Targetic.Tactic.FY18", Sum(Impressions), Sum(Clicks), Sum("Planned.Spend.Creative.Daily.NK") FROM R ')

sqldf('SELECT distinct "Targeting.Tactic.FY18" FROM R')

sum(R$Impressions,na.rm = FALSE)


group_by(R$Targeting.Tactic.FY18)

?group_by
rm(imagename)














