##Get the count of lines file
linesBlogs<-length(blogsProcessed) ##lines
linesNews<-length(newsProcessed) ##lines
linesTwitter<-length(twitterProcessed) ##lines

## Segregating into training and testing
##Setting seed to make these results reproducible
set.seed(10)
BlogSample<-sample(linesBlogs,linesBlogs*0.6)
NewsSample<-sample(linesNews, linesNews*0.6)
TwitterSample<-sample(linesTwitter,linesTwitter*0.6)

blogsTraining<-blogsProcessed[BlogSample]
newsTraining<-newsProcessed[NewsSample]
twitterTraining<-twitterProcessed[TwitterSample]

blogsTest<-blogsProcessed[-BlogSample]
newsTest<-newsProcessed[-NewsSample]
twitterTest<-twitterProcessed[-TwitterSample]

write(blogsTraining, file = "blogsTraining.txt",
      append = FALSE)
write(newsTraining, file = "newsTraining.txt",
      append = FALSE)
write(twitterTraining, file = "twitterTraining.txt",
      append = FALSE)
write(blogsTest, file = "blogsTest.txt",
      append = FALSE)
write(newsTest, file = "newsTest.txt",
      append = FALSE)
write(twitterTest, file = "twitterTest.txt",
    append = FALSE)

