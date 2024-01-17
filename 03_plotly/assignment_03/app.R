ui <- fluidPage(
  plotlyOutput("movie_plot")
)

server <- function(input, output) {
  

    output$movie_plot <- renderPlotly({
    
    my_plot <- ggplot(biopics) +
      aes(x = box_office, 
          y=year_release,
          color=type_of_subject,
          gender=subject_sex) +
      geom_point() +
      theme(legend.position="none")
    
    ##notice we pass our ggplot into ggplotly, which makes it more interactive
    ggplotly(my_plot)
  })
}


shinyApp(ui, server)