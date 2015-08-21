## Download the file 
if (!file.exists("Coursera-SwiftKey.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip", "Coursera-SwiftKey.zip")
  unzip("Coursera-SwiftKey.zip")
}

##Load the Data into R
con<-file('en_US/en_US.blogs.txt','r')
blogs<-readLines(con)
close(con)

con<-file('en_US/en_US.news.txt','rb')
news<-readLines(con)
close(con)

con<-file('en_US/en_US.twitter.txt','r')
twitter<-readLines(con)
close(con)


## load some required library
library(stringi)


## understanding the data
sizeBlogs<-file.info('en_US/en_US.blogs.txt')$size/1024^2 ## size
linesBlogs<-length(blogs) ##lines
charsBlogs<-sum(nchar(blogs)) ## no of characters
wordsBlogs<-sum(stri_count_words(blogs))

sizeNews<-file.info('en_US/en_US.news.txt')$size/1024^2 ## size
linesNews<-length(news) ##lines
charsNews<-sum(nchar(news)) ## no of characters
wordsNews<-sum(stri_count_words(news))

sizeTwitter<-file.info('en_US/en_US.twitter.txt')$size/1024^2 ## size
linesTwitter<-length(twitter) ##lines
charsTwitter<-sum(nchar(twitter)) ## no of characters
wordsTwitter<-sum(stri_count_words(twitter))