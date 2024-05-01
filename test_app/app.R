library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "n_breaks", label = "Number of Bins in Histogram", min = 5,
              max=40,value = 30),

  plotOutput(outputId = "main_plot", height = "300px")
)

server <- function(input, output) {
  
  output$main_plot <- renderPlot({
    
    hist(faithful$eruptions,
         probability = TRUE,
         breaks = as.numeric(input$n_breaks),
         xlab = "Duration (minutes)",
         main = "Geyser eruption duration")
    
  })
}
shinyApp(ui = ui, server = server)
