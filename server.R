#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram

shinyServer(function(input, output) {
  # Reactive expression to get selected variable data
  selectedData <- reactive({
    airquality[[input$variable]]
  })
  
  output$summary <- renderPrint({
    summary(selectedData())
  })
  
  output$histPlot <- renderPlot({
    hist(selectedData(),
         breaks = input$bins,
         main = paste("Histogram of", input$variable),
         xlab = input$variable,
         col = "skyblue", border = "white")
  })
})
