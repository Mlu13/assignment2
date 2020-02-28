library(shiny)
ui <- fluidPage(
  numericInput(inputId = "n",label = "sample size",value = 25),
  plotOutput(outputId = "hist")
)
server <- function(input, output){ 
  #create input function & output function
  output$hist <- renderPlot({hist(rnorm(input$n))})
  }
shinyApp(ui = ui, server = server)
