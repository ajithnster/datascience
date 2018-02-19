setwd("C:\\Users\\AJITHNamboothiri\\Downloads")
install.packages("openxlsx")
library(openxlsx)
iter  =1

myFirstFun<-function(filename,startTab,endTab)
{
 data = read.xlsx(filename, iter, startRow = 1) 
 for (iter in startTab:endTab) {

	print(paste("Sheet = ",iter))
	temp_data = read.xlsx(filename, iter, startRow = 1) # open the file 
	temp <- temp_data[,1:ncol(temp_data)]
	data <- cbind(data,temp)
 }
 final <- data

 out_file = paste("out_",substr(filename, 1, nchar(filename)-5),".csv",sep = "" )
if (file.exists(out_file)) file.remove(out_file)	
 write.csv(final,file=out_file)
	
}
myFirstFun("ocss17feb.xlsx",2,30)

library(data.table) 
trdf = read.csv("out_ocss17feb.csv")
df = transpose(trdf)
df = df[complete.cases(df[,6]),]
df= df[-1,-1]
title = df[1,]
df = df[complete.cases(df[,2:3]),]
df = rbind(title,df)
mylist = list()
mylist["# Mentored"] = 6
mylist["Total Registered"] = 10
mylist["Part RF Call - late"] = 13
mylist["Parent RF Call - late"] = 16
mylist["Mentor RF Call - late"] = 18
mylist["# CIFs Comp"] = 24
numcols = ncol(df)
required = cbind(df[1:3],df[,mylist[[1]]],df[,mylist[[2]]],df[,mylist[[3]]],df[,mylist[[4]]],df[,mylist[[5]]],df[,mylist[[6]]])
View(required)
write.csv(required,"final.out.csv")
