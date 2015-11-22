##Graphical representation of Ability to detect Process Change.
##Server code
##It was found necessary use tabs so that sufficient documentation for explaination could be included in this app.
##Apologies for the long line of code but app seemed to get buggy if I broke up the lines.
##Note: The variable hours refers to the batch size slider.

##Create funtions.
##The first is used to calculate confidence intervals based on slider values
CI95<-function(prob,hours,CI) qbinom(c((1-CI)/2,(CI+(1-CI)/2)), hours, prob, lower.tail = TRUE)
##The second is used to calculate probability distributions for the graphs.
probf<-function(fail1,fail2,prob,hours) pbinom(c(fail1:fail2), hours, prob, lower.tail = TRUE)-pbinom(c((fail1-1):(fail2-1)), hours, prob, lower.tail = TRUE)
probf2<-function(fail1,fail2,prob,hours) pbinom(c(fail1:fail2), hours, prob, lower.tail = TRUE)



shinyServer(
        function(input, output) {            
                output$newPlot<-renderPlot({
                        ##Creates a plot of the red probability distribution
                        plot(input$failure[1]:input$failure[2],probf(input$failure[1],input$failure[2],input$prob2,input$hours),col="red",
                             ylab="Probability",xlab="Defects per Batch",
                             main="Probability of Defect with Confidence Intervals")
                        ##Adds Blue probability distribution.
                        points(input$failure[1]:input$failure[2],probf(input$failure[1],input$failure[2],input$prob1,input$hours),col="blue")
                        ##Adds confidence intervals
                        abline(v=c((CI95(input$prob1,input$hours,input$CI))),col="blue",lwd=1)
                        abline(v=c((CI95(input$prob2,input$hours,input$CI))),col="red",lwd=1)
                        
                })
                
                
                
        }
        
)