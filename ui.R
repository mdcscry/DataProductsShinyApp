
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("NFL Wide Receiver Draft Predictor"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      tags$b(),
      h5('Select a value for each of the three variables and hit the submit button in the main panel.  The predicted outcome will appear below.'),
      tags$br(),tags$br(),
      sliderInput("Weight",
                  "Weight:",
                  min = 160,
                  max = 250,
                  value = 201.48) ,
      sliderInput("Forty",
                  "Forty Yard Dash:",
                  min = 4.00,
                  max = 5.00,
                  value = 4.51, step= 0.01),
      sliderInput("Vert",
                  "Vertical Jump:",
                  min = 30,
                  max = 45,
                  value = 35),
      
      tags$br(),tags$br(),
      h5('The calculation used in this app:'),
      h5('predict(modelFit,newdata=test_predict)')
      
  
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h4('Below see the weight you entered reduced by the mean weight of NFL combine participants'),
      verbatimTextOutput("oWeight"),
      h4('Below see the forty yard dash time you entered reduced by the mean time of NFL combine participants'),
      verbatimTextOutput("oForty"),
      h4('Below see the vertical leap you entered reduced by the mean vertical leap of NFL combine participants'),
      verbatimTextOutput("oVert"),
      tags$br(),tags$br(),
      submitButton('Submit'),
      tags$br(),
      tags$br(),     
      h4('The predicted outcome: '),
      tags$br(), tags$b(),
      verbatimTextOutput("oPrediction")
    )
  )
))







