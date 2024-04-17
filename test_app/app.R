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
 
  paired_plot2 <- renderPlot({.       #2 Mistakes here
    ggplot(biopics) + 
      aes(x=year_release, 
          y=box_office, 
          color= .data[[input$color_select_new]]) +   #Mistake here
      geom_point()
  })
}

shinyApp(ui = ui, server = server)