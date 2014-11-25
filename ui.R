shinyUI(pageWithSidebar(
  headerPanel("MTcars Data Set"),
  sidebarPanel(
      textInput("caption", "Caption:", "Relationship to Mileage"), br(), br(),
      strong("Description of possible attibutes:"), br(),
      span("* cyl  = Number of cylinder"), br(),
      span("* disp = Displacement (cu.in.)"), br(),
      span("* hp   = Gross horsepower"), br(),
      span("* drat = Rear axle ratio"), br(),
      span("* wt   = Weight (lb/1000)"), br(),
      span("* qsec = 1/4 mile time"), br(),
      span("* vs   = V/S"), br(),
      span("* am   = Transmission (0=automatic, 1=manual)"), br(),
      span("* gear = Number of forward gears"), br(),
      span("* carb = Number of carberators"), br(), br(), br(),
    selectInput("attribute", "Choose an attribute:", 
                choices =  c("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")),
    selectInput("LMline", "Include regression line in plot?",  
                choices = c("yes", "no")),
    submitButton('Submit')
  ),
  
  mainPanel(
    h3("This panel will display the plot mpg relative to the selected MTcars attribute. ", style="color:blue"),
    br(),
    h3(textOutput("caption")),
    h4('You selected field:'),
    verbatimTextOutput("attribute"), 
    br(),
    h3('Mileage Plot'),
    plotOutput("newplot")
  )
))