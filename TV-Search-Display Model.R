

SN<-lm(formula = Search.Total.Clicks ~ National.TV.Total, data = d)
summary(SN)
R<- lm(formula = Search.Total.Clicks ~ National.TV.Total + Display.Total.Impressions, data = d)
R
summary(R)

SD<-lm(formula = d$Search.Total.Clicks ~ d$Display.Total.Impressions, data = d)
SD
summary(SD)

M<-glm(formula = Search.Total.Clicks ~ National.TV.Total + Spot.TV + Display.Total.Impressions, data = d)
summary(M)
--------------------------------------------------------------
  
d <- read.csv("C:/Users/sagar.doshi/Desktop/R Automation/Search_TV_Display Data.csv")
Out<-lm(Search.Total.Clicks ~ National.TV.Total + Spot.TV + Display.Total.Impressions, data = d, model = TRUE, qr= TRUE)
str(d)
summary(Out)
M <- cor(d[,c(2,3,4,5)], d[,c(2,3,4,5)])


--------------------------------------------------------------

N <- read.csv("C:/Users/sagar.doshi/Desktop/R Automation/Model ds.csv")

Output <-lm(branded_user_cnt ~ natl_a25_54_imps_mm + spot_a25_54_imps_mm
 + imp_cnt_mm, data = N, model = TRUE, qr= TRUE)
str(Output)  
summary(Output)
C <- cor(N[,c(1,2,3,4)], N[,c(1,2,3,4)])

