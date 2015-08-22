library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Distribution of Means from Large Sample"),
  sidebarPanel(
    sliderInput('nosim', 'Numbers of Sampling:',min = 500, max = 1500, value = 1000, step = 100),
    numericInput('size', 'Size of Sampling', 40, min = 10, max = 100, step = 5),
    numericInput('lambda', 'rate of exponential distribution', .2, min = .1, max = 1, step = .1),
    submitButton('Submit'),
    helpText("Note: This application shows the sampling distribution of",
             "means from the exponential distribution and compare the simulation",
             "results with the theoretical results predicted by the Central Limit Theorem(CLT)." ,
             "You can choose the following parameters:" ,
             "(1)The numbers of sampling, this should be an integer.",
             "(2)Size of the sample, this should also be an integer.",
             "(3)The rate parameter of exponential distribution, range from 0.1 to 1.",
             "--- --- ---",
             "In the Figure, the blue curve shows the density of the sample mean distribution,",
             "The blue vertical line is the mean value of the sample means.",
             "The red curve is the normal distribution,",
             "and the red long-dashed vertical line shows the mean value predicted by the CLT.")
  ),
  mainPanel(
    plotOutput('Hist')
  )
))
