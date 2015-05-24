
library(shiny)
library(caret)
library(randomForest)

demeanWeight <- function(Weight) Weight - 201.48
demeanForty <- function(Forty) Forty - 4.51
demeanVert <- function(Vert) Vert - 35.52

load("data/wrmodelFit.rda") 

prd_model <- function(vert,forty,weight) {
        
  test_predict<-data.frame(weight,forty,vert)
  colnames(test_predict) <- c("weight","forty","vert")
  
  ifelse(predict(modelFit,newdata=test_predict)==1,"Later Round Draft or free agent","1rst or 2nd round pick")
  
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$oVert <- renderPrint({demeanVert(input$Vert)})
  output$oForty <- renderPrint({demeanForty(input$Forty)})
  output$oWeight <- renderPrint({demeanWeight(input$Weight)})
  output$oPrediction <- renderPrint({prd_model(demeanVert(input$Vert),demeanForty(input$Forty),demeanWeight(input$Weight))})
  })



