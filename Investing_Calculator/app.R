#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(reshape2)
library(ggplot2)

# Define UI for the Investing Calculator Application
ui <- fluidPage(
   
   # Application title
   titlePanel("Investing Calculator"),
   
   # The six input widgets for the application
   fluidRow(
     column(3,
            sliderInput('amount', 'Initial Amount', 
                        min=1, max=100000, value=1000),
            br(),
            sliderInput('contrib', 'Annual Contribution', 
                        min=0, max=50000, value=2000)
     ),
     column(4, offset = 1,
            sliderInput('return', 'Return Rate (in %)', 
                        min=0, max=20, value=5),
            br(),
            sliderInput('growth', 'Growth Rate (in %)', 
                        min=0, max=20, value=2)
     ),
     column(4, 
            sliderInput('year', 'Years', 
                        min=0, max=50, value=10),
            br(),
            selectInput('facet', 'Facet?', 
                        choices = list("Yes" = 1, "No" = 2), selected = 2)
     )
   ),
   # Main panel for displaying outputs ------
   mainPanel(
     # Output: Header + generated timeline plot
     h4("Timelines"),
     plotOutput("plot"),
     # Output: Header + generated data table
     h4("Balances"),
     verbatimTextOutput("datatable")
   )
)

# Define server logic required to draw timeline plot and data table
server <- function(input, output) {
   
   # Generate data table output
   output$datatable <- renderPrint({
     no_contrib <- c()
     fixed_contrib <- c()
     growing_contrib <- c()
     year <- c(0:input$year)
     amount <- input$amount
     return <- input$return / 100
     growth <- input$growth / 100
     contrib <- input$contrib
     for (i in year) {
       FV <- (amount * (1 + return)^i)
       FVA <- contrib * (((1+return)^i - 1) / return)
       FVGA <- contrib * (((1+return)^i - (1+growth)^i) / (return-growth))
       no_contrib[i+1] <- FV 
       fixed_contrib[i+1] <- FV + FVA
       growing_contrib[i+1] <- FV + FVGA
     }
     modalities <- data.frame(year, no_contrib, fixed_contrib, growing_contrib)
     modalities
   })
   
   # Generate the timeline plot
   output$plot <- renderPlot({
     no_contrib <- c()
     fixed_contrib <- c()
     growing_contrib <- c()
     year <- c(0:input$year)
     amount <- input$amount
     return <- input$return / 100
     growth <- input$growth / 100
     contrib <- input$contrib
     facet <- input$facet
     for (i in year) {
       FV <- (amount * (1 + return)^i)
       FVA <- contrib * (((1+return)^i - 1) / return)
       FVGA <- contrib * (((1+return)^i - (1+growth)^i) / (return-growth))
       no_contrib[i+1] <- FV 
       fixed_contrib[i+1] <- FV + FVA
       growing_contrib[i+1] <- FV + FVGA
     }
     modalities <- data.frame(year, no_contrib, fixed_contrib, growing_contrib)
     if (facet == 2) {
       df <- melt(modalities, id.vars= 'year', variable.name = 'variable')
       ggplot(df, aes(year, value)) + geom_line(aes(colour = variable)) + ggtitle(label = "Three modes of investing") + labs(x = "year", y = "value") + theme_bw() + geom_point(aes(colour = variable)) 
     } else {
       df <- melt(modalities, id.vars= 'year', variable.name = 'variable')
       ggplot(df, aes(year, value)) + geom_line(aes(colour = variable)) + ggtitle(label = "Three modes of investing") + labs(x = "year", y = "value") + theme_bw() + geom_point(aes(colour = variable)) + facet_wrap(~variable) + geom_area(aes(fill = variable), alpha = 0.5)
       
     }
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

