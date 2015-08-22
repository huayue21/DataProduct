library(shiny)
library(UsingR)
library(ggplot2)

shinyServer(
  function(input, output) {
    output$Hist <- renderPlot({
      # 1000 samples with size 40 and parameter lambda .2
      nosim <- input$nosim
      n <- input$size
      lambda <- input$lambda
      # simulate sampling data from expoential populations with given parameters
      df <- data.frame(x = apply(matrix(rexp(nosim*n,rate = lambda),nosim), 1, mean))
      g1 <- ggplot(data = df, mapping = aes(x = x))
      g1 <- g1 + ggtitle("Density of Sampling Means from Exponential Population")
      g1 <- g1 + geom_histogram( fill = NA, binwidth=0.03/lambda, aes(y = ..density..),color = "black")
      g1 <- g1 + geom_density(size = 1,color = 'blue')
      g1 <- g1 + geom_vline(xintercept = mean(df$x),size = 1,color='blue')
      g1 <- g1 + geom_vline(xintercept = 1/lambda,size = 1,color = 'red',linetype = "longdash")
      #g1 <- g1 + annotate("mu = ", x = 8, y = .4, label = mean(df$x)))
      #text(8, .4, paste("mu = ", mean(df$x)))
      #text(6, .5, paste("CLT.mean = ",1/lambda ))
      x.norm <- seq(min(df), max(df),length=100)
      y.norm <- dnorm(x.norm, 1/lambda, (1/lambda)/sqrt(n))
      dat.norm <- data.frame(x.norm,y.norm)
      g2 <- g1 + ggtitle("Distribution of Simulated Sample Means vs. \n
                         Normal Distribution")
      g2 <- g2 + geom_line(data = dat.norm,aes(x = x.norm,y=y.norm),color='red',
                           size=1,linetype="longdash")
      print(g2)
      })
    
  }
)
