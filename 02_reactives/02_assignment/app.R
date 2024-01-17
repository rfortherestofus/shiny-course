library(shiny)
library(dplyr)
library(fivethirtyeight)
library(ggplot2)
data(biopics)
biopics <- biopics |> filter(!is.na(box_office))

ui <- fluidPage(
  plotOutput("paired_plot"),
  sliderInput(inputId = "year_slider",
              label = "Select Year to Filter",
              min = 1915,
              max = 2014,
              value = 1990)
)

server <- function(input, output) {
  
  biopics_filt <- reactive({
    req(input$year_slider)
    biopics %>%
      dplyr::filter(year_release < ------)
    
  })
  
  
  output$paired_plot <- renderPlot({
    
    ggplot(-------) + 
      aes(x=year_release, 
          y=box_office, 
          color= type_of_subject) +
      geom_point()
  })
  
}

shinyApp(ui = ui, server = server)