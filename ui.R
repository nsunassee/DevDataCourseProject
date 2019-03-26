library(shiny) 

shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel(" Body Mass Index (BMI) Calculator"),
    
    sidebarPanel(
      p('Body Mass Index is an estimate of the body fat of a person, calculated using their height and weight'),
      p('The formula is BMI = kg/m2, with the weight in kg and m2 is their height in metres squared.'),
      p('A healthy BMI is between 18.5 to 24.9. Should your BMI be over 25, this may indicate that you are overweight.'),
      p('While BMI applies to most adults 18-65 years, please note that this is indicative only. Consult your doctor for further information'),
      
      tags$div(
        tags$ul(
          tags$li('BMI < 18.5 : You are Underweight'),
          tags$li('BMI [18.5-24.9] : Your weight is Healthy'),
          tags$li('BMI [25-29.9] : You are Overweight'),
          tags$li('BMI >=30 : Your weight indicates Obesity. You should consult your doctor urgently!')
        )
      )
    ),
    
    mainPanel(
      numericInput('weight', 'Enter your weight (in kg)', 0),
      numericInput('height', 'Enter your height (in m)', 0, min = 1.00, max = 2.19, step = 0.01),
      submitButton('Calculate your BMI'),
      
      h2('Calculating your BMI:'), 
      h5('weight:'), verbatimTextOutput("inputweightvalue"),
      h5('height:'), verbatimTextOutput("inputheightvalue"),
      h3('Your BMI is:'),
      verbatimTextOutput("estimation"),
      h2('Your Result is:'),strong(verbatimTextOutput("diagnostic"))
    )
  )   
)