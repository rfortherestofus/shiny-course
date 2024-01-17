library(shiny)
library(fivethirtyeight)
library(ggplot2)

data(biopics)

ui <- fluidPage(
  plotOutput("paired_plot")
)


server <- function(input, output) {
  output$paired_plot <- renderPlot({


      })
}
shinyApp(ui = ui, server = server)
