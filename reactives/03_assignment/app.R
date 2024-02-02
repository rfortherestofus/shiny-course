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
  
  # fix this line - reactives aren't sent to output
  output$biopics_filtered <- reactive({
 
    biopics %>%
      dplyr::filter(year_release < input$year_slider)
    
  })
  
  
  output$paired_plot <- renderPlot({
    
    # fix this line - we need to call our reactive
    # as a function
    ggplot( biopics_filtered  ) + 
      aes(x=year_release, 
          y=box_office, 
          color= type_of_subject) +
      geom_point()
  })
  
}

shinyApp(ui = ui, server = server)