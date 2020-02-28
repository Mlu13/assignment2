library(shiny)
# Define UI
setwd("/Users/maggie/Documents/Bioinfo/Shiny")
df <- data.frame("diabetes2.csv", header = T, stringsAsFactors = F)

ui <- fluidPage(
  
  # App title
  titlePanel('App 2 - Boxplot'),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    
    # Sidebar panel for inputs
    sidebarPanel(
      
      # Input:
      selectInput(inputId = "select", label = "Select the variable", choices = names(df)),
      sliderInput(inputId = "slider",label = )
      textInput(inputId = "title",label = "Title of the boxplot" ),
      checkboxInput(inputId = "color",label = "choose the color", FALSE )
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


