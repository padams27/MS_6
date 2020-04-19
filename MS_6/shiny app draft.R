#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(shinythemes)


ui <- navbarPage("Analysing Brexit",
                 theme = shinytheme("flatly"),
                 
                 #### ABOUT
                 
                 tabPanel("About",
                          
                          #title and subtitle
                          
                          h2("How do the 2016 referendum results correlate with other national statistics?", align = "center"),
                          br(),
                          div(),
                          
                          
                          br(),
                          
                          fluidRow(column(2), column(11,
                                                     
                                                     h4(strong("About this Project")),          
                                                     
                                                     #text to introduce project
                                                     
                                                     p("The aim of my project is to explore the relationship between the 2016 UK 'Brexit' referendum and other data points 
                                                        relating the region where the votes were cast to the age and employment levels. The point of this is to try and 
                                                        either dispel or prove the common belief that the older the voter was the more likely they were to vote to leave 
                                                        the EU. The same is true for the supposed realtionship between unemployment and voting for leave. To do this I have 
                                                        used the UK goverment EU referendum data and the 2011 nationwide census data, both freely available online. "),
                                                     
                                                     br(),
                                                     
                                                     
                          ))),
                 
                 
             #### DATA
             
                 tabPanel("Graphics",
                          tabPanel("Graphics",
                                       h3("First Plot:"),
                                       plotOutput("unemployment_leave"),
                                   
                            sidebarPanel(
                              helpText("Choose a varibale to view corellation plot"),
                                selectInput("account_name", "NCAA Twitter Accounts:",
                                                   choices = list("@NCAA" = "NCAA",
                                                                  "@NCAAIceHockey" = "NCAAIceHockey",
                                                                  "@NCAATrackField" = "NCAATrackField",
                                                                  "@NCAALLAX" = "NCAALAX",
                                                                  "@NCAASoccer" = "NCAASoccer"),
                                                   selected = "")),
                                   
                            mainPanel(plotOutput(xxxxxx))),
                            
                          ))),
                 

                 
            #### FOOTNOTES
                 
                 
                 #tab to explain where I got my data 
                 
                 tabPanel("Footnotes",
                          
                          
                          h4("References"),
                          br(),
                          
                          p("I obtained my data from the UK goverment and their Brexit and 2011 national census. Both are online and for public use."),
                          p("My Github repo: https://github.com/padams27/MS_6 ")
                          ))


server <- function(input, output, session) {
    

    #### DATA
    
    
    output$unemployment_leave <- renderPlot({
        
        ggplot(join, aes(join_unemp_data, pct_leave)) +
            geom_point() +
            geom_smooth(method=lm, se = FALSE) +
            scale_x_continuous(labels = function(x) paste0(x, "%")) +
            scale_y_continuous(labels = function(y) paste0(y, "%")) +
            labs(y = "Percentage vote leave",
                 x = "No adults in employment in household (with no dependent children)",
                 title = "Relationship Between Regional Household Unemployment
       and Brexit: Vote Leave") +
            theme_classic()
        
        
    })

    
    
}


# Run the application 
shinyApp(ui = ui, server = server)
