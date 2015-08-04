library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Diebets Prediction"),
    
    sidebarPanel(
      textInput("name","Enter you name:"),
      radioButtons("gender","Your gender:", c("Male" = "Male" ,"Female" = "Female" )),
      
      checkboxGroupInput("outputType","Select Predictors:", c("Height" = "height", "BMI" = "BMI" ), selected = "height"),
      numericInput("age","Age",15, min=0, max=100,step=1),
      numericInput("height","Height (cm)",150, min=100, max=200,step=5 ),
      sliderInput("weight", "Weight (kg)", value =30, min = 10, max = 200, step = 2 ),
      
      submitButton("Submit")
     
      
    ),
    
    mainPanel(
      h3("Results of Prediction"),
      h4("You entered"),
      verbatimTextOutput("inputValue"),
      h4("Which resulted in a prediction of"),
      verbatimTextOutput("predition"),
      
      plotOutput("compareHeight")
    )
    
  )
)
