##create wordclouds for the overall corpus for Uni, Bi, Tri grams
## these ngrams are created using KfNgram software
library(wordcloud)
##Unigram
blogsUnigram <- read.table("blogsProcessed.txt-01-ngrams-Freq.txt",sep="\t")
newsUnigram <- read.table("newsProcessed.txt-01-ngrams-Freq.txt",sep="\t")
twitterUnigram <- read.table("twitterProcessed.txt-01-ngrams-Freq.txt",sep="\t")
Unigram <- rbind(blogsUnigram, newsUnigram, twitterUnigram)
UnigramSum <- aggregate(V2~V1, data=Unigram, sum)
UnigramSort <- arrange(UnigramSum, desc(V2))
##WordCloud
pal <- brewer.pal(6,"Dark2")
wordcloud(UnigramSort$V1, UnigramSort$V2,c(8,.6),max.words=200,random.order=F,rot.per=0.15, colors=pal,use.r.layout=FALSE)

##Bigram
newsBigram <- read.table("newsProcessed.txt-02-ngrams-Freq.txt", sep ="\t")
blogsBigram <- read.table("blogsProcessed.txt-02-ngrams-Freq.txt", sep ="\t")
twitterBigram <- read.table("twitterProcessed.txt-02-ngrams-Freq.txt", sep ="\t")
Bigram <- rbind(blogsBigram,newsBigram,twitterBigram)
BigramSum <- aggregate(V2~V1, data=Bigram, sum)
BigramSort <- arrange(BigramSum, desc(V2))
wordcloud(BigramSort$V1, BigramSort$V2,c(8,.3),max.words=100,random.order=F,rot.per=0.15, colors=pal,use.r.layout=FALSE)

##Trigram
blogsTrigram <- read.table("blogsProcessed.txt-03-ngrams-Freq.txt", sep ="\t")
newsTrigram <- read.table("newsProcessed.txt-03-ngrams-Freq.txt", sep ="\t")
twitterTrigram <- read.table("twitterProcessed.txt-03-ngrams-Freq.txt", sep ="\t")
Trigram <- rbind(blogsTrigram,newsTrigram,twitterTrigram)
TrigramSum <- aggregate(V2~V1, data=Trigram, sum)
TrigramSOrt <- arrange(TrigramSum, desc(V2))

wordcloud(TrigramSOrt$V1, TrigramSOrt$V2,c(4,.2),max.words=100,random.order=F,rot.per=0.15, colors=pal,use.r.layout=FALSE)