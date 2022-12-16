library(shiny)
h1("My title")


ui <- fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel(
      h1("Installation"),
      p("Shiny is aaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaa"),
      p("console:"),
      code('install.packages("shiny")'),
      br(),
      br(),
      img(src = "rstudio.png", height = 60, weidth = 40)
    ),
    mainPanel(
      h1("Introducing Shiny"),
      p("Shiny is aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
      br(),
      br(),
      
      h1("Features"),
      p("- Build Useful web aaaaaaaaaaaaaaaa"),
      p("- Shiny applications are aaaaaaaaaaaaa")
      
    )
    
  )
)

server <- function(input, output) {
  
}


shinyApp(ui = ui, server = server)