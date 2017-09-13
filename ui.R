#UI.R
#
# This is the user-interface of Shiny web application. You can
# run the application by clicking 'RunApp' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that predicts the survival of passengers 
## onboard on Titanic
shinyUI(fluidPage(
    
    # Writing title of the web page
    titlePanel("Titanic Survival Prediction"),
    
    # Layout provides the options where in users can select the input       for a particular pessenger
    sidebarLayout(
        sidebarPanel(
            p("Please select the details below"),
            
            # Taking "Passenger Class" inputs using Numeric input
            numericInput("pas", "Passenger Class:", 1, min = 1, max = 3
                         ),
            
            # Taking "Family Size" inputs using slider input
            numericInput("fam", "Family Size:", value = 1, min = 1, max
                         = 11),
            
            # Taking "Title" inputs using text input
            selectInput("tit", "Title:", list("Mr" = "Mr.",
                                              "Master" = "Master.",
                                           "Miss" = "Miss.", 
                                           "Mrs" = "Mrs.",
                            "other" = "other"), selected	= "Mr."),
            
            # Taking "Age" inputs using Slider input
            sliderInput("age", "Age:", 0 , 80, value = 25),
            
            # Taking "Embarked" inputs using Radio buttons
            radioButtons("emb", "Port of Embarkation:", list( "Southampt
                                                              on" = "S",
                                                 "Cherbourg" = "C",
                                                  "Queenstown" = "Q"
                                                 ), selected =  "S"),
           
           # Taking "Sex" inputs using Radio buttons
           radioButtons("sex", "Sex:", list( " Male" = "male",
                                             " Female" = "female"),
                                                selected =  "male")
        ),
        
        # Layout displays the output: Survival Prediction and a Plot  
        mainPanel(
            h3("Survival Probability"),
            
            # Predicted Survival Probability
            p("Predicted Survival Probability using Logistic Regression
              : 1 - Yes, 0 - No"),
            h4(textOutput("prob1")),
            # Plot 1
            plotOutput("plot1")
        )
    )
))