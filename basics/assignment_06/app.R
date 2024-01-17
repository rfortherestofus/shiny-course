library(shiny)
library(fivethirtyeight)
library(ggplot2)
library(dplyr)

data(biopics)
categoricalVars <- c("country", "type_of_subject", "subject_race", "subject_sex")

ui <- fluidPage(
  
  plotOutput("paired_plot"),
  sliderInput(inputId = "year_slider",
              label = "Select Year to Filter",
              min = 1915,
              max = 2014,
              value = 1990)
)


server <- function(input, output) {
  biopics_filtered <- reactive({
    
    biopics %>%
      dplyr::filter(year_release < input$year_slider)
    
  })

  
  output$paired_plot <- renderPlot({
    # fix this line - make sure it matches the ui line above
    
    ggplot(biopics_filtered()) + 
      aes(x=year_release, 
          y=box_office, 
          color= subject_sex) +
      geom_point()
  })

}
shinyApp(ui = ui, server = server)