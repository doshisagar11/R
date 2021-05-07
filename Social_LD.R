s <- read.csv("C:/Users/sagar.doshi/Desktop/R Automation/Social_Link Download/IKEA Raw Feed.csv")

j <-2236

for (i in s$image_link)
{
  
  imagename = paste0("image",j,".jpg")
  try(download.file(i,imagename,mode = 'wb'))
  save.image()
  j <- j+1
}
