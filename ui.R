shinyUI(fluidPage(
        
        titlePanel("Graphical representation of Ability to detect Process Change."),
                sidebarLayout(
                sidebarPanel(
                        numericInput('prob2', 'RED: Proposed probability of producing defective unit', 0.025, min = 0, max = 0.5, step = 0.002),
                        numericInput('prob1', 'BLUE: Existing probability of producing defective unit', 0.03, min = 0, max = 0.5, step = 0.002),
                        sliderInput('hours', 'Batch Size:', 
                                    min=0, max=10000, value=50, step=10),
                        sliderInput('failure', 'X Axis:', 
                                    min = 0, max = 500, value = c(0,10), step= 1),
                        sliderInput('CI', 'Confidence Interval:', 
                                    min = 0.5, max = 1, value = 0.95, step= 0.01)
                ),
                mainPanel(
                        tabsetPanel(
                                tabPanel("Plot", plotOutput('newPlot')), 
                                tabPanel("Help",
                                         h4('This data product compares the defect rate of an existing process with the expected defective rate of a proposed changed. It is useful in visualising the size of the trial necessary to validate the change. A defect is considered to be an unsalable item.'),
                                         h4('The RED probability is the expected defective probability of the new process. This should be less than the Blue probability for the graph to work correctly.'),
                                         h4('The BLUE probability is the defective probability of the existing process.'),
                                         h4('The Batch Size is the number of units made. A larger batch size will produce more accurate results but will have economic consequences.'),
                                         h4('The X Axis controls the size of the X Axis. This can be used to zoom into the area of interest.'),
                                         h4('The vertical lines on the graph (by default) show the 95 % confidence interval of the respective process. Note: red lines over-write the blue. We want as smaller overlap as possible.'),
                                         h4('The confidence interval slider can be used to adjust the vertical lines. This may be useful when we want to know the power of our prosed experiment.')
                                         ) 

                        )
                )                                         
                )
        )
)
