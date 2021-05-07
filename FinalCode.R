install.packages("xlsx")
install.packages("rJava")
install.packages('readxl')

library(xlsx)
library(readxl)




files <- list.files(path="U:/mec/Dept/Interaction/Insights and Analytics/Client Work and Analyses/IKEA/Audience Strategy & Targeting/Jan2019POTS/Cross-tab Freqs/Output/3rd File - Copy", full.names=TRUE, recursive=FALSE)
k=1

for(j in files){
  
  maindf1 <- data.frame()
  mysheetlist <- excel_sheets(path= j)
  for (i in 1:length(mysheetlist))
  {
    onedf1 <- read_excel(path= j, sheet = mysheetlist[i], col_names = FALSE)
    maindf1 <- rbind(maindf1,onedf1)
    maindf1[nrow(maindf1)+1,]<- "---------------------------------------"
    ggg1 <- maindf1
    filename = paste0(k,".csv") 
    destination <- "U:/mec/Dept/Interaction/Insights and Analytics/Client Work and Analyses/IKEA/Audience Strategy & Targeting/Jan2019POTS/Cross-tab Freqs/Output/Merged_3rd File/"
    write.csv(ggg1, paste0(destination,filename), row.names = FALSE, na = "")
  }
  k <- k+1
  filename = NULL
}
