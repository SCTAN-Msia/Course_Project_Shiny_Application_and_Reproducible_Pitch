#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Air Quality Analysis - New York (1973)"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Instructions: Select a variable to analyze from the dropdown list. 
                     Adjust the number of histogram bins with the slider. 
                     Summary stats and histogram will update reactively."),
      
      selectInput("variable", "Select Variable:",
                  choices = names(airquality)[sapply(airquality, is.numeric)]),
      
      sliderInput("bins", "Number of bins for histogram:", min = 5, max = 50, value = 15)
    ),
    
    mainPanel(
      h4("Summary Statistics"),
      verbatimTextOutput("summary"),
      
      h4("Histogram of Selected Variable"),
      plotOutput("histPlot")
    )
  )
))