## predict height
## if is over age 25, the height will be the same 
## otherwise, male will grow 2cm every year before 25 and female grow 1cm
heightTrend <- function(height,age,gender) {
  if (age > 25) {
    height
  }
  else {
    if (gender == "Male")
      height <- height + (25 - age) * 2
    if (gender == "Female")
      height <- height + (25 - age) * 1
    height
  }
}
## calculate the BMI
BMI<- function(height,weight)   round(weight/(height/100)^2,2)

shinyServer(
  function(input,output){
    inputValue <- reactive({
      paste("Name:",input$name," Age:",input$age," Gender:", input$gender,
                        " Height:", input$height," Weight:", input$weight)
      })
    output$inputValue <- renderPrint({inputValue()})
    
    prediction <- reactive({
      prediction <-""
      if ( "height" %in% input$outputType )
      prediction <- paste("Your height at age 25:",heightTrend(input$height,input$age,input$gender))
    if ( "BMI" %in% input$outputType ){
       bmi <- BMI(input$height,input$weight)
      prediction <- paste(prediction, " Your BMI:",bmi)
       
    }
      prediction
    })
                          
    output$predition <- renderPrint({prediction()})
    ## campare the height to US women
    output$compareHeight <-renderPlot({
      data(women)
      women$height <- women$height * 2.54
      women$weight <- women$weight * 0.45
      plot(women$weight, women$height,type = "p",
           main = "Your height among US women ", 
           xlab ="weight (kg)",
           ylab="height (cm)")
      
      abline(input$height,0)
      
      
    })
  }
)
