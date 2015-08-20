library(data.table)
library(plyr)

###this model will predict and return 5 most frequent words
predict2 <- function(input){
if (input!="")
{
   input <- gsub("[[:punct:]]+","",input)
   input <- gsub("[[:digit:]]+","",input)
   input <- tolower(input)
   input <- strsplit(input, " ")
   input <- unlist(input)
   input <- rev(input)
   input1 <- input[2]
   input2 <- input[1]
   TrigramAns <- TrigramHighFrequent[J(input1,input2)]
   BigramAns <- BigramHighFrequent[J(input2)]
   if(sum(TrigramAns$V2, na.rm = TRUE) >0)
   {
      TrigramAns[,Probability:=TrigramAns$V2/sum(TrigramHighFrequent$V2)]
      BigramAns[,Probability:= BigramAns$V2/sum(BigramHighFrequent$V2) * 0.4]
      NextWordList <- rbindlist(list(BigramAns[,3:4,with = FALSE],TrigramAns[,4:5,with = FALSE]))
      setkey(NextWordList, NextWord)
      NextWordList<-unique(NextWordList)
      setorder(NextWordList, -Probability)
      ##Sending the Most frequent 5 words
      return(NextWordList[1:5,]$NextWord)
   }
   else 
    {
        if (sum(BigramAns$V2, na.rm = TRUE)>0)
        {
          return (BigramAns$NextWord)
        }
        else return (UnigramFrequent[1:5]$V1)  
     }
}
else return ("")
}
##this will predict only one word
# predict <- function(input){
#   ##input <- gsub('\\',"", input)
#   input <- gsub("[[:punct:]]+","",input)
#   input <- gsub("[[:digit:]]+","",input)
#   input <- tolower(input)
#   input <- strsplit(input, " ")
#   input <- unlist(input)
#   input <- rev(input)
#   input1 <- input[2]
#   input2 <- input[1]
#   TrigramAns <- TrigramHighFrequent[J(input1,input2)]
#   BigramAns <- BigramHighFrequent[J(input2)]
#   if(sum(TrigramAns$V2, na.rm = TRUE) >0)
#   {
#     TrigramProbability<-TrigramAns[1]$V2/sum(TrigramHighFrequent$V2)
#     BigramProbability <- BigramAns[1]$V2/sum(BigramHighFrequent$V2) * 0.4
#     if(TrigramProbability>BigramProbability) {
#       return (TrigramAns[1]$NextWord) }
#     else { return (BigramAns[1]$NextWord) }
#   }
#   else 
#   {
#     if (sum(BigramAns$V2, na.rm= TRUE)>0)
#     {
#        return (BigramAns[1]$NextWord)
#     }
#     else return (UnigramFrequent[1]$V1)  
#   }
# }