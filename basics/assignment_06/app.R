library(shiny)
library(fivethirtyeight)

data(biopics)

categoricalVars <- c("country", "type_of_subject", "subject_race", "subject_sex")

ui <- fluidPage(
  selectInput(inputId = "color_select", 
              label = "Select Categorical Variable", 
              choices = categoricalVars),
  plotOutput("paired_plot")
)


server <- function(input, output) {
  
  #fix this line - make sure it matched the corresponding ui line above
  paired_plot2 <- renderPlot({       
    ggplot(biopics) + 
      aes(x=year_release, 
          y=box_office, 
  #fix this line
          color= .data[[input$color_select_new]]) + 
      geom_point()
  })
}

shinyApp(ui = ui, server = server)