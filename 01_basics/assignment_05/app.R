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
  output$paired_plot <- renderPlot({
    ggplot(biopics) + 
      aes(x=year_release, 
          y=box_office, 
          color= .data[[--------]]) +   #fill in this blank
      geom_point()
  })
}

shinyApp(ui = ui, server = server)