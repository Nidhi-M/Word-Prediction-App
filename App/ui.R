shinyUI(fluidPage(
  #theme = shinytheme("cerulean"),
  titlePanel("Word predictor app"),
  sidebarLayout(
    sidebarPanel(
      textInput("inputText", label = h3("Please enter some text"), 
                value = ""),
      submitButton("Predict"),
      #textOutput("nextwords")
      br(),
      h3("Next words can be"),
      verbatimTextOutput("nextwords")
     ),
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("App Info", 
                           tags$div(br(),
                                    tags$p("This is a Shiny application that accepts text as input and predicts the next word."),
                                    tags$ol(
                                    tags$li(h5("Enter some text inside the text box on left hand side panel")),
                                    tags$li(h5("Click Predict in order to get the next word that may follow your patial statement")),
                                    tags$li(h5("Top 5 most likely words will be displayed"))
                                           ),
                                    tags$p(h4("I hope it guessed right!"))
                                    )
                           ),
                  tabPanel("Futher details", 
                           tags$div(
                                   br(),
                                   tags$p("This app is a data product built as part of Capstone project of", tags$a(href= "https://www.coursera.org/specialization/jhudatascience/1","Data Science Specialization"),"on Coursera provided by",tags$strong("Jonhs Hopkins University"),"in association with SwiftKey"),
                                   br(),
                                   tags$p("For knowing more about the data used, refer to this" , tags$a(href = "http://rpubs.com/MNidhi/MilestoneReport", "report")),
                                   tags$p("For details about this product you would want to look into this " , tags$a(href = "http://rpubs.com/MNidhi/FinalPresentation", "presentation")),
                                   tags$p("All the code and data is uploaded on " , tags$a(href = "https://github.com/Nidhi-M/Word-Prediction-App", "GitHub"))
                           ),
                           br(),
                           tags$p(h4("Acknowledgements")),
                           br(),
                           tags$div(
                                  tags$a(href="https://www.coursera.org/specialization/jhudatascience/1", tags$img(src="CourseTrackLogo.png" ,height =120 , width = 140)),
                                  tags$a(href="http://www.citiustech.com/",tags$img(src="CitiusTechLogo.png" ,height =120 , width = 120)),
                                  tags$a(href="http://swiftkey.com/en/",tags$img(src="SwiftKey.png" ,height =120 , width = 200))
                                  
                           )
                  
                         )
             )
           )
        )
     ))