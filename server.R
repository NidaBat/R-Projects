#SERVER.R
#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'RunApp' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)

# Define server logic to display the outcome and to draw a plot
shinyServer(function(input, output) {

# Read data from titanic dataset
## Please not that data prepration 'titanicDataPrepration' has been done prior to creating 'titanic' dataset
    
titanic <-read.csv("train.test_com.csv", header = TRUE)

# writing Server function

# Build the model using Logistic Regression
model_glm<- glm(survived ~ pclass + sex + age + embarked + title + family.size,family=binomial(link='logit'),data=titanic)

# Select options based on user input
model1_pred <- reactive({
    pasInput <- input$pas
    famInput <-input$fam
    titInput <- input$tit
    ageInput <-input$age
    embInput <-input$emb
    sexInput <-input$sex
    # Predicts the Survival probability 
    ## always predict 0 (didn't survive), 1 (survived)
    fitted.results <- predict(model_glm, newdata = data.frame(pclass =
    pasInput, family.size = famInput, title = titInput, age = ageInput,
    embarked = embInput, sex = sexInput, type = "response"))
    fitted.results <- ifelse(fitted.results > 0.5,1,0)
    })
    # Renders the text for the prediction model above
    output$prob1<- renderText({model1_pred()
    })
    # Renders plot for the prediction model above
    output$plot1 <- renderPlot({
    # Visualize the predicted survival on Titanic
     plot(predict(model_glm,type="response"), ylab ="Survival Rate",
          main = "Titanic Survival Prediction")
    })
})



