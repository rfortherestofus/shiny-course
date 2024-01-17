library(shiny)
library(fivethirtyeight)
library(ggplot2)
data(biopics)

ui <- fluidPage(
  plotOutput("my_plot")
)


server <- function(input, output) {

  output$_______ <- renderPlot({
    ggplot(biopics) + 
      aes(x=year_release, 
          y=box_office, 
          color=type_of_subject) +
      geom_point()
  })

}



shinyApp(ui = ui, server = server)