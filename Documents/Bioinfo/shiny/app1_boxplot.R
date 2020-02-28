library(shiny)
# Define UI
ui <- fluidPage(

  # App title
  titlePanel('App 2 - Boxplot'),

  # Sidebar layout with input and output definitions
  sidebarLayout(

    # Sidebar panel for inputs
    sidebarPanel(

      # Input:
      sliderInput(inputId = "n", label = "Sample size", min = 10, max = 100, value = 50),
      textInput(inputId = "y",label = "Title of the boxplot" ),
      radioButtons(inputId = "b",label = "choose the color", c("Blue","green",'Red'),selected = "Blue" )
    ),
 

    # Main panel for displaying outputs
    mainPanel(
  
      plotOutput(outputId = "boxplot")
      
      
    )
  )
)

# Define server
server <- function(input, output) {
  output$boxplot <- renderPlot({boxplot(rnorm(input$n), col = input$b, main = input$y)})
  #output$boxplot <- renderPlot({boxplot(rnorm(input$n),col = input$b)}) #button
  
  
}

shinyApp(ui, server)


