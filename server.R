
CI95<-function(prob,hours,CI) qbinom(c(1-CI,CI), hours, prob, lower.tail = TRUE)
probf<-function(fail1,fail2,prob,hours) pbinom(c(fail1:fail2), hours, prob, lower.tail = TRUE)-pbinom(c((fail1-1):(fail2-1)), hours, prob, lower.tail = TRUE)
probf2<-function(fail1,fail2,prob,hours) pbinom(c(fail1:fail2), hours, prob, lower.tail = TRUE)



shinyServer(
        function(input, output) {            
                output$newPlot<-renderPlot({
                        plot(input$failure[1]:input$failure[2],probf(input$failure[1],input$failure[2],input$prob2,input$hours),col="red",
                             ylab="Probability",xlab="Defects per Batch",
                             main="Probability of Defect with Confidence Intervals")
                        points(input$failure[1]:input$failure[2],probf(input$failure[1],input$failure[2],input$prob1,input$hours),col="blue")
                        abline(v=c((CI95(input$prob1,input$hours,input$CI))),col="blue",lwd=1)
                        abline(v=c((CI95(input$prob2,input$hours,input$CI))),col="red",lwd=1)
                        
                })
                
                
                
        }
        
)