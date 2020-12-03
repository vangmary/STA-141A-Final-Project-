setwd("/Users/trucle/Desktop/STA\ 138/Bank/bank-additional")
# for this project we will be using the bank-additional-full.csv to do our analysis on.
bank_data_full <- read.csv("bank-additional-full.csv", sep=";", stringsAsFactors = F, header = T) 
# this allows for the data to be separated rather than being mushed together.
write.csv(bank_data_full, "cleaned_bank_additional_full.csv") 
# this write the clean data into a separate csv that we can use to work with
any(is.na(bank_data_full))
# this to see if the data has been cleaned of all missing data.
bank <- read.csv("cleaned_bank_additional_full.csv")[-1] # -1 to get rid of them counting the # of rows 
summary(bank) # this to print out the summary of the dataset.
names(bank) # show us the lists of observation categories within the dataset.
bank$age <- as.numeric(bank$age)
bank$duration <- as.numeric(bank$duration)
bank$campaign <- as.numeric(bank$campaign)
bank$pdays <- as.numeric(bank$pdays)
bank$previous <- as.numeric(bank$previous)
bank$emp.var.rate <- as.numeric(bank$emp.var.rate)
bank$cons.price.idx <- as.numeric(bank$cons.price.idx)
bank$cons.conf.idx <- as.numeric(bank$cons.conf.idx)
bank$nr.employed <- as.numeric(bank$nr.employed)
sapply(bank, function(x) sum(is.na(x))) # this shows that there is no missing values within the dataset for any categories
# we transformed all of the quantitative values into numeric class for easier manipulation later on. 

summary(bank)
names(bank)
str(bank)
bank$y =ifelse(bank$y =="yes",1,0) # transforming 'yes' category into a binary
str(bank)
summary(bank)
prop.table(table(bank$y)) #Observe that the dataset predicted outcome (y) is skewed towards ‘no’ with over 88%.
library(ggplot2)
ggplot(bank, aes(x = marital, fill=marital)) + geom_bar()# bar chart for martial status 
ggplot(bank, aes(x = job, fill=job))+geom_bar() # bar chart for job
ggplot(bank, aes(x = education, fill=education))+geom_bar() # bar chart for education
hist(bank$age)
