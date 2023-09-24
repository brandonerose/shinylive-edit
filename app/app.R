webr::install('plotly')
webr::install('DT')
library('shiny')
library('plotly')
library('DT')

ui <- fluidPage(
  titlePanel("Hello Shiny!"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    mainPanel(
      plotOutput(outputId = "distPlot"),
      DTOutput("table1"),
      plotlyOutput('fig')
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    })
  output$table1 <- renderDT({datatable(mtcars)})
  output$fig <- renderPlotly({
    Animals <- c("giraffes", "orangutans", "monkeys")
    SF_Zoo <- c(20, 14, 23)
    LA_Zoo <- c(12, 18, 29)
    data <- data.frame(Animals, SF_Zoo, LA_Zoo)
    fig <- plot_ly(data, x = ~Animals, y = ~SF_Zoo, type = 'bar', name = 'SF Zoo')
    fig <- fig %>% add_trace(y = ~LA_Zoo, name = 'LA Zoo')
    fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'group')
    fig
  })
}

shinyApp(ui = ui, server = server)
