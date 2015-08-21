##This all done on Training data
##Unigram Creation
blogsUnigramTrain <- read.table("blogsTraining.txt-01-ngrams-Freq.txt",sep="\t")
newsUnigramTrain <- read.table("newsTraining.txt-01-ngrams-Freq.txt",sep="\t",fill = TRUE)
twitterUnigramTrain <- read.table("twitterTraining.txt-01-ngrams-Freq.txt",sep="\t")

UnigramTrain <- rbind(blogsUnigramTrain, newsUnigramTrain, twitterUnigramTrain)
##Aggregating the count same words
UnigramTrainSum <- aggregate(V2~V1, data=UnigramTrain, sum)
##Sort them with respect to count
UnigramTrainSort <- arrange(UnigramTrainSum, desc(V2))
rm(blogsUnigramTrain, newsUnigramTrain,twitterUnigramTrain)
write.csv(UnigramTrainSort,"UnigramTrainSort.csv",row.names = FALSE)


##Bigram Creation
newsBigramTrain <- read.table("newsTraining.txt-02-ngrams-Freq.txt", sep ="\t", fill =TRUE)
blogsBigramTrain <- read.table("blogsTraining.txt-02-ngrams-Freq.txt", sep ="\t")
twitterBigramTrain <- read.table("twitterTraining.txt-02-ngrams-Freq.txt", sep ="\t")
BigramTrain <- rbind(blogsBigramTrain,newsBigramTrain,twitterBigramTrain)
rm(newsBigramTrain,blogsBigramTrain,twitterBigramTrain)
BigramTrainSum <- aggregate(V2~V1, data=BigramTrain, sum)
BigramTrainSort <- arrange(BigramTrainSum, desc(V2))
write.csv(BigramTrainSort,"BigramTrainSort.csv",row.names = FALSE)
rm(BigramTrainSum,BigramTrain)


##Trigram data waas huge(740 MB overall, so did calculations on individual files(and each file into 3 parts), using data table could have been faster)
###Trigram Creation
###BLOGS DATA
blogsTrigramTrain1 <- read.table("blogsTraining.txt-03-ngrams-Freq.txt", sep ="\t",nrows = 4418718)
blogsTrigramTrainSum1 <- aggregate(V2~V1, data=blogsTrigramTrain1, sum)
blogsTrigramTrainSort1 <- arrange(blogsTrigramTrainSum1, desc(V2))
write.csv(blogsTrigramTrainSort1,"blogsTrigramTrainSort1.csv",row.names = FALSE)

rm(blogsTrigramTrain1,blogsTrigramTrainSum1)

blogsTrigramTrain2 <- read.table("blogsTraining.txt-03-ngrams-Freq.txt", sep ="\t",nrows = 4418718, skip = 4418718)
blogsTrigramTrainSum2 <- aggregate(V2~V1, data=blogsTrigramTrain2, sum)
blogsTrigramTrainSort2 <- arrange(blogsTrigramTrainSum2, desc(V2))
write.csv(blogsTrigramTrainSort2,"blogsTrigramTrainSort2.csv",row.names = FALSE)

rm(blogsTrigramTrainSum2,blogsTrigramTrain2)

blogsTrigramTrain3 <- read.table("blogsTraining.txt-03-ngrams-Freq.txt", sep ="\t",nrows = 4418718, skip = 4418718*2)
blogsTrigramTrainSum3 <- aggregate(V2~V1, data=blogsTrigramTrain3, sum)
blogsTrigramTrainSort3 <- arrange(blogsTrigramTrainSum3, desc(V2))
write.csv(blogsTrigramTrainSort3,"blogsTrigramTrainSort3.csv",row.names = FALSE)

blogsTrigramTrainRbind <- rbind(blogsTrigramTrainSort1,blogsTrigramTrainSort2,blogsTrigramTrainSort3)
blogsTrainTrigramSum <- aggregate(V2~V1,data=blogsTrigramTrainRbind, sum)
blogsTrainTrigramSort <- arrange(blogsTrainTrigramsum, desc(V2))

##NEWS DATA
newsTrigramTrain1 <- read.table("newsTraining.txt-03-ngrams-Freq.txt", sep ="\t",nrows = 4255166, fill = TRUE)
newsTrigramTrainSum1 <- aggregate(V2~V1, data=newsTrigramTrain1, sum)
newsTrigramTrainSort1 <- arrange(newsTrigramTrainSum1, desc(V2))
write.csv(newsTrigramTrainSort1,"newsTrigramTrainSort1.csv",row.names = FALSE)

rm(newsTrigramTrain1,newsTrigramTrainSum1)

newsTrigramTrain2 <- read.table("newsTraining.txt-03-ngrams-Freq.txt", sep ="\t",nrows = 4255166, skip = 4255166, fill = TRUE)
newsTrigramTrainSum2 <- aggregate(V2~V1, data=newsTrigramTrain2, sum)
newsTrigramTrainSort2 <- arrange(newsTrigramTrainSum2, desc(V2))
write.csv(newsTrigramTrainSort2,"newsTrigramTrainSort2.csv",row.names = FALSE)

rm(newsTrigramTrainSum2,newsTrigramTrain2)

newsTrigramTrain3 <- read.table("newsTraining.txt-03-ngrams-Freq.txt", sep ="\t",nrows = 4255166, skip = 4255166*2 , fill = TRUE)
newsTrigramTrainSum3 <- aggregate(V2~V1, data=newsTrigramTrain3, sum)
newsTrigramTrainSort3 <- arrange(newsTrigramTrainSum3, desc(V2))
write.csv(newsTrigramTrainSort3,"newsTrigramTrainSort3.csv",row.names = FALSE)

rm(newsTrigramTrain3,newsTrigramTrainSum3)

newsTrigramTrainRbind <- rbind(newsTrigramTrainSort1,newsTrigramTrainSort2,newsTrigramTrainSort3)

newsTrainTrigramSum <- aggregate(V2~V1,data=newsTrigramTrainRbind, sum)
newsTrainTrigramSort <- arrange(newsTrainTrigramSum, desc(V2))
write.csv(newsTrainTrigramSort,"newsTrainTrigram.csv",row.names=TRUE)


##TWITTER DATA
twitterTrigramTrain1 <- read.table("twitterTraining.txt-03-ngrams-Freq.txt", sep ="\t",nrows = 3646935)
twitterTrigramTrainSum1 <- aggregate(V2~V1, data=twitterTrigramTrain1, sum)
twitterTrigramTrainSort1 <- arrange(twitterTrigramTrainSum1, desc(V2))
write.csv(twitterTrigramTrainSort1,"twitterTrigramTrainSort1.csv",row.names = FALSE)

rm(twitterTrigramTrain1,twitterTrigramTrainSum1)

twitterTrigramTrain2 <- read.table("twitterTraining.txt-03-ngrams-Freq.txt", sep ="\t",nrows = 3646935, skip = 3646935)
twitterTrigramTrainSum2 <- aggregate(V2~V1, data=twitterTrigramTrain2, sum)
twitterTrigramTrainSort2 <- arrange(twitterTrigramTrainSum2, desc(V2))
write.csv(twitterTrigramTrainSort2,"twitterTrigramTrainSort2.csv",row.names = FALSE)

rm(twitterTrigramTrainSum2,twitterTrigramTrain2)

twitterTrigramTrain3 <- read.table("twitterTraining.txt-03-ngrams-Freq.txt", sep ="\t",nrows = 3646935, skip = 3646935*2)
twitterTrigramTrainSum3 <- aggregate(V2~V1, data=twitterTrigramTrain3, sum)
twitterTrigramTrainSort3 <- arrange(twitterTrigramTrainSum3, desc(V2))
write.csv(twitterTrigramTrainSort3,"twitterTrigramTrainSort3.csv",row.names = FALSE)

twitterTrigramTrainSort <- rbind(twitterTrigramTrainSort1,twitterTrigramTrainSort2,twitterTrigramTrainSort3)
twitterTrainTrigramSum <- aggregate(V2~V1,data=twitterTrigramTrainSort, sum)
twitterTrainTrigramSort <- arrange(twitterTrainTrigramSum, desc(V2))

write.csv(twitterTrainTrigramSort,"twitterTrainTrigram.csv",row.names=TRUE)

rm(twitterTrainTrigramSort, twitterTrainTrigramSum)

library(data.table)
###merging the Trigrams created
##getting Twitter file
TwitterTrigram<-fread("Training Set Ngrams/TwitterTrigrams/twitterTrainTrigram.csv", sep2=" ")

##getting all blogstrigram file
blogs1 <-fread("Training Set Ngrams/BlogsTrigram/blogsTrigramTrainSort1.csv",sep2=" ")
blogs2 <-fread("Training Set Ngrams/BlogsTrigram/blogsTrigramTrainSort2.csv",sep2=" ")
blogs3 <-fread("Training Set Ngrams/BlogsTrigram/blogsTrigramTrainSort3.csv",sep2=" ")
##binding them
BlogsTrigram<-rbindlist(list(blogs1,blogs2,blogs3))

##Getting all the News file
NewsTrigram<-fread("Training Set Ngrams/newsTrigram/newsTrainTrigram.csv", sep2=" ")
 colnames(TwitterTrigram)<- c("rowname", "V1","V2")
colnames(NewsTrigram)<- c("rowname", "V1","V2")
NewsTrigram[,rowname:=NULL]
TwitterTrigram[,rowname:=NULL]

##binding all the trigrams into one table
TrigramTrain <- rbindlist(list(BlogsTrigram,NewsTrigram,TwitterTrigram)) ##this returns 36284002 
TrigramTrainSum <- TrigramTrain[, sum(V2), by=V1]
colnames(TrigramTrainSum) <- c("V1","V2") ## this returns 32897346

write.csv(TrigramTrainSum,"TrigramTrainSum.csv", row.names = FALSE)

