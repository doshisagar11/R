

install.packages("XLConnect")
install.packages("XLConnectJars")
install.packages("openxlsx")
install.packages("readxl")
install.packages("rJava")
install.packages(java)
library(readxl)
library(openxlsx)
library(XLConnect)
library(XLConnectJars)
library(rJava)
library(xlsx)

require(XLConnect)



getwd()       
setwd("C:/Users/sagar.doshi/Desktop/R Automation/Pots Project") 
#to update R 

if(!require(installr)) {
  install.packages("installr"); require(installr)} #load / install+load installr
# using the package:
updateR() # this will start the updating process of your R installation.  It will check for newer versions, and if one is available, will guide you through the decisions you'd need to make.



--------------------------------------------------------------------------------------------------
library(readxl)    
read_excel_allsheets <- function("C:/Users/sagar.doshi/Desktop/R Automation/Pots Project/Area (Bathroom) - file1.xlsx", tibble = FALSE) {
  # I prefer straight data.frames
  # but if you like tidyverse tibbles (the default with read_excel)
  # then just pass tibble = TRUE
  sheets <- readxl::excel_sheets("C:/Users/sagar.doshi/Desktop/R Automation/Pots Project/Area (Bathroom) - file1.xlsx")
  x <- lapply(sheets, function(X) readxl::read_excel("C:/Users/sagar.doshi/Desktop/R Automation/Pots Project/Area (Bathroom) - file1.xlsx", sheet = X))
  if(!tibble) x <- lapply(x, as.data.frame)
  names(x) <- sheets
  x
}
write.csv(x,"C:/Users/sagar.doshi/Desktop/R Automation/Pots Project/Final.csv")

y<- lapply(excel_sheets("C:/Users/sagar.doshi/Desktop/R Automation/Pots Project/Area (Bathroom) - file1.xlsx"), function(x) as.data.frame(read_excel("C:/Users/sagar.doshi/Desktop/R Automation/Pots Project/Area (Bathroom) - file1.xlsx", x)))

write.csv(y,"C:/Users/sagar.doshi/Desktop/R Automation/Pots Project/Final.csv")


#Code to merge various files together
  multmerge = function(mypath){
  filenames=list.files(path=mypath, full.names=TRUE)
  datalist = lapply(filenames, function(x){read.csv(file=x,header=T)})
  Reduce(function(x,y) {merge(x,y)}, datalist)
  
  
 # Using PAckage Rio 
  install.packages('feather')
  install.packages('hexView')
  library(rio)
  
#Importing file
  data_list <- import_list("C:/Users/sagar.doshi/Desktop/R Automation/Pots Project/Area (Bathroom) - file1.xlsx", rbind = TRUE)
  new <- import_list("C:/Users/sagar.doshi/Desktop/R Automation/Pots Project/Area (Bathroom) - file1.xlsx")

  str(df)
  class(df)
  flag = 1
  for(i in new){
    if(flag == 1) {
      print(i[1])
    }
    flag =0
  }
  
  #convert a list of data frames into a single data frame
  new1 <- ldply(new, data.frame)
  class(new1)
  str(new1)
  new[1]
  # take the first row and copy it to a new data frame
  new_df<- as.data.frame(c(colnames(new1)))
  new_df1<- as.data.frame(t(new_df))
  new_df1<- setNames(new_df1, c(1:236))
  
  # to rename colnames
  new2 <-setNames(new1, c(1:236))
  
  #Joining the two dfs
  
  final<- rbind(new_df1,new2)

  #more manuplations
  read final[16:236]
  for (i in c(final$`16`:final$`236`))
  {
    final$`15`<- final[i]  
  }

  
  rm(new_df)
  
  write.csv(final,"C:/Users/sagar.doshi/Desktop/R Automation/Pots Project/Final3.csv", na = "")
  