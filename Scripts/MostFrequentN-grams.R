library(data.table)
trigramTrain<-fread("Training Set Ngrams/TrigramTrainSum.csv", sep2=" ")
bigramTrain<-fread("Training Set Ngrams/BigramTrainSort.csv", sep2=" ")
unigramTrain<-fread("Training Set Ngrams/UnigramTrainSort.csv", sep2=" ")

##For most frequent Trigram data (only those trigrams that have frequency more than 1)
TrigramFrequent<- trigramTrain[V2>1,]
setkey(TrigramFrequent,"V1")
TrigramFrequent$W1 <- as.character(lapply(strsplit(as.character(TrigramFrequent$V1),split = " "),"[",1))
TrigramFrequent$W2 <- as.character(lapply(strsplit(as.character(TrigramFrequent$V1),split = " "),"[",2))
TrigramFrequent$NextWord <- as.character(lapply(strsplit(as.character(TrigramFrequent$V1),split = " "),"[",3))
TrigramFrequent[, V1:=NULL]
setkeyv(TrigramFrequent,cols=c("W1","W2"))


##For most frequent Bigram data
##Remove all bigrams that have frequency 2 and below  
BigramFrequent <- bigramTrain[V2>2,]
setkey(BigramFrequent,"V1")
BigramFrequent$W1 <- as.character(lapply(strsplit(as.character(BigramFrequent$V1),split = " "),"[",1))
BigramFrequent$NextWord <- as.character(lapply(strsplit(as.character(BigramFrequent$V1),split = " "),"[",2))
BigramFrequent[, V1:=NULL]
setkeyv(BigramFrequent,cols="W1")


##For most frequent Unigram data
##Remove all trigrams that have frequency 3 and below  

UnigramFrequent <- unigramTrain[V2>3,]
setkey(UnigramFrequent,"V1")

##For all the unique combination of the first two words(W!, W2) present in the data table, only first 5 most frequent combination was taken into consideration  

setorder(TrigramFrequent, W1, W2, -V2)
TrigramHighFrequent<-TrigramFrequent[, .SD[1:5],by = c("W1", "W2")]
TrigramHighFrequent<-TrigramHighFrequent[!is.na(V2),]
setkeyv(TrigramHighFrequent, c("W1","W2"))

## for Bigrams, all the combinations that have W1 as the first word only first five most frequent combination was taken into consideration
setorder(BigramFrequent, W1, -V2)
BigramHighFrequent<-BigramFrequent[, .SD[1:5],by ="W1"]
BigramHighFrequent<-BigramHighFrequent[!is.na(V2),]
setkeyv(BigramHighFrequent, "W1")

setorder(UnigramFrequent,-V2)






