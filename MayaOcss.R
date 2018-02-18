setwd("C:\\Users\\AJITHNamboothiri\\Downloads")
install.packages("openxlsx")
library(openxlsx)


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
 write.csv(final,file=out_file)
}
myFirstFun("ocss17feb.xlsx",2,30)
View(final)
