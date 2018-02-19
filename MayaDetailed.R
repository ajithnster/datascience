setwd("C:\\Users\\AJITHNamboothiri\\Downloads")
install.packages("openxlsx")
library(openxlsx)

for (iter in 2:2) {

print(paste("Sheet = ",iter))
stat = read.xlsx("2018 Detailed Statistics Feb17.xlsx", iter, startRow = 2, colNames = TRUE) # open the file 
tot_col <- ncol(stat)
stat[,tot_col+1] = ""

for(i in 2:nrow(stat)) 
{ 

if (is.na(stat[i,1])) 
{
    if (stat[i-1,tot_col+1] == "") {	
   	event = stat[i-2,1]
    	leader = stat[i-2,2]
    	event_date = stat[i-1,1]
        print(event_date)
        event_count = stat[i-1,2]
    }
    stat[i,tot_col+1] = event_date
    stat[i-1,tot_col+1] = event_date
    stat[i-1,1] = event
    stat[i,1] = event    
    stat[i-1,2] = leader
    stat[i,2] = leader    
}

}
title <- stat[1,]
library(dplyr)
f1 <- filter(stat,X3=="NET TARGET - WEEKLY")
f2 <- filter(stat,X3=="NET ACTUAL REGISTRATION - WEEKLY")
result <- rbind(title,f1,f2)
 test <- as.data.frame(lapply(result[1,], function(x)  as.character(as.Date(as.numeric(x), origin = "1899-12-30"))))
 names(test) <- names(result)
 t1 <- rbind(test,result)

rm(f1,f2,title,fname)

fname = paste("us2018Febout3",iter,".csv",sep="")
write.csv(t1,fname)
}

