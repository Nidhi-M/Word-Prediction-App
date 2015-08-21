shinyServer(function(input, output) {
  library(shinythemes)
  library(data.table)
  library(plyr)
  
  predict2 <- function(input){
    if (input!="")
    {
      ##input <- gsub('\\',"", input)
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
        if (sum(BigramAns$V2, na.rm= TRUE)>0)
        {
          return (BigramAns$NextWord)
        }
        else return (UnigramFrequent[1:5]$V1)  
      }
    }
    else return ("")
  }
  
   output$nextwords <- renderText({
     validate(
       need(input$inputText != "", "enter text and press submit"))
     paste( predict2(input$inputText), collapse = "\n")}) 
 
   
  })
  
