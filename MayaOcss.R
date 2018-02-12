setwd("C:\\Users\\AJITHNamboothiri\\Downloads")
require(xlsx)


data = read.xlsx2("ocfs9feb.xlsx", 1) # open the file 

for (i in 2:30) {

temp_data = read.xlsx2("ocfs9feb.xlsx", i) # open the file 

temp <- temp_data[,3:ncol(temp_data)]
data <- cbind(data,temp)

}
final <- data
final <- final[-1,]
final <- final[-1,]
final <- final[,-1]