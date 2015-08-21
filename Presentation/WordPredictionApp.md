Word Prediction 
========================================================
  
    
    
Capstone Project  
Data Science Specialization   
Nidhi Mavani    
16th August 2015  



========================================================
### Motivation
The goal of capstone project of Data science specialization was to build a shiny app that will predict the next word in a sentence. It is a problem that falls under Natural language processing

### Data and Pre-processing 
The Corpus used for this app was taken from sources such as news, blogs and twitter (~550MB).   
This data provided was pre-processed to remove punctuations, numbers, whitespaces, profane words to avoid predicting any of them. From the processed data, [ngrams](https://en.wikipedia.org/wiki/N-gram) of length 1, 2 and 3 were made using [KfNgram](http://www.kwicfinder.com/kfNgram/kfNgramHelp.html) software.


| Source |Total(MB)| Training(MB)|        
|------- |-------- |------------ |      
|  Blogs |  200    |    119      |      
|  News  |  196    |   116       |      
| Twitter|  160    |     92      |      
  
========================================================
The total size of the RData file used for the app is about 100MB where all the grams were stored in data table. Table shows the size of ngrams before and after pruning  

|Ngram   | Total Size(MB) | Final Size(MB)|   
|------- |--------------- |-------------- |   
|Unigram |  200           | 2             | 
|Bigram  |  203           | 4             | 
|Trigram |  740           | 58            | 


### Prediction Algorithm

The algorithm used to make a model using the Tri-, Bi-, Unigram is Stupid Backoff. It takes  about 20ms to return with top 5 most likely next words.  
The algorithm which helps in calculating score of the next word is follows  
   ![As](WordPredictionApp-figure/Algorithm.png)  
   
========================================================

### Challenges
- The TM package ran too slow so had to choose an alternative to use third party tool to generate ngrams which was faster (matter of a few minutes)


### Future Possibilities
- Smoothing techniques that can be implemented for better accuracy of the model
  1. Kneser ney
  2. Good Turing 
- Higher n-gram model (4, 5, 6- grams) can be made
- Futher more generic data from various sources can be used (like Google N-grams)
- Punctuations like apostrophes should be included in predictions  

========================================================
### Links and references
 
- Word Predictor [Shiny app](https://nidhim.shinyapps.io/WordPredictionApp)   
- [Milestone Report](https://rpubs.com/MNidhi/MilestoneReport)  (Explorartory analysis of data)      
- [GitHub](https://github.com/Nidhi-M/Word-Prediction-App) repository  

- [Data Science Specialization](https://www.coursera.org/specialization/jhudatascience/1) by Johns Hopkins University
- [Natural Language Processing](https://www.coursera.org/course/nlp) by Stanford University on coursera

