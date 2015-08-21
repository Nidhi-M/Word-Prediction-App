##Remove punctuations
blogsProcessed<- gsub('[[:punct:]]+','',blogs)
newsProcessed<- gsub('[[:punct:]]+','',news)
twitterProcessed<- gsub('[[:punct:]]+','',twitter)

##Remove numbers
blogsProcessed<- gsub('[[:digit:]]+','',blogsProcessed)
newsProcessed<- gsub('[[:digit:]]+','',newsProcessed)
twitterProcessed<- gsub('[[:digit:]]+','',twitterProcessed)

##make all characters to lower to have consistency 
blogsProcessed <- tolower(blogsProcessed)
newsProcessed  <-  tolower(newsProcessed)
twitterProcessed  <-  tolower(twitterProcessed)

##remove whitespaces
blogsProcessed<-stripWhitespace(blogsProcessed)
newsProcessed<-stripWhitespace(newsProcessed)
twitterProcessed<-stripWhitespace(twitterProcessed)


##Removing Profane words
con<-file('Downloads/listOfProfanitybyShuttershock.txt','r')
profaneWords<-readLines(con)
close(con)
##look for individual words and remove them from the corpus if present to avoid predicting them
profaneBoundary <- paste0("\\b(", paste0(profaneWords, collapse="|"), ")\\b")  
 
blogsProcessed<- gsub(profaneBoundary, "", blogsProcessed)
newsProcessed<- gsub(profaneBoundary, "", newsProcessed)
twitterProcessed<- gsub(profaneBoundary, "", twitterProcessed)