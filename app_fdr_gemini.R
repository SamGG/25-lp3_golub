# I want a program in R shiny with 2 text inputs and a popup menu, plus a graphic and a text output

library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("R Shiny Example"),

  sidebarLayout(
    sidebarPanel(
      textInput("text1", "Enter Text 1:", value = "Hello"),
      textInput("text2", "Enter Text 2:", value = "World"),
      selectInput("menu", "Choose an Option:", choices = c("Option A", "Option B", "Option C"))
    ),

    mainPanel(
      plotOutput("plot"),
      textOutput("outputText")
    )
  )
)

server <- function(input, output, session) {

  output$plot <- renderPlot({
    # Example plot (you can customize this)
    data <- data.frame(x = 1:10, y = rnorm(10))
    ggplot(data, aes(x, y)) + geom_line() + ggtitle(paste("Plot based on:", input$menu))
  })

  output$outputText <- renderText({
    paste("Text 1:", input$text1, ", Text 2:", input$text2, ", Menu Choice:", input$menu)
  })
}

shinyApp(ui = ui, server = server)
