data(mtcars)
attach(mtcars)

shinyServer(
  function(input, output) {

  
    formulaText <- reactive({
      paste(input$attribute, "~ mpg")
      })    
          
    output$caption <- renderText({
      input$caption
    })
     
    output$attribute <- renderPrint({
        switch(input$attribute,
               "cyl"  = "Number of cylinder", 
               "disp" = "Displacement (cu.in.)", 
               "hp"   = "Gross horsepower", 
               "drat" = "Rear axle ratio", 
               "wt"   = "Weight (lb/1000)", 
               "qsec" = "1/4 mile time", 
               "vs"   = "V/S", 
               "am"   = "Transmission (0=automatic, 1=manual)", 
               "gear" = "Number of forward gears",
               "carb" = "Number of carberators")
    })
    
#     output$attribute <- renderText({
#       input$attribute
#    })
    
    output$oid1 <- renderPrint({
      input$id1
    })
    
    output$newplot <- renderPlot({
      plot(as.formula(formulaText()), data=mtcars)
      if (input$LMline =="yes") {
        abline(lm(as.formula(formulaText())))
      }
    })
  
  }
)