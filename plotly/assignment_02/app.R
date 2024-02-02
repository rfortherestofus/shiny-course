library(shiny)
library(dplyr)
library(fivethirtyeight)
library(ggplot2)
library(plotly)
data(biopics)
biopics <- biopics |> filter(!is.na(box_office))

ui <- fluidPage(
  plotlyOutput("paired_plot")
)

server <- function(input, output) {
  
  output$paired_plot <- renderPlot({
    
    out_plot <- ggplot(biopics) + 
      aes(x=year_release, 
          y=box_office, 
          color= type_of_subject,
          title=title) +
      geom_point()
    
    ggplot(out_plot)
  })
  
}

shinyApp(ui = ui, server = server)