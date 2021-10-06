shinyServer(function(input, output, session) {

    output$clients<-renderValueBox({
        x_temp<-dataframe(DataFrame)
        x<-subset(x_temp, format.Date(date, "%m")==input$monthsel)
        valueBox(
            value=sum(x$clients),
            subtitle="Number of clients:",
            icon=icon("chart-area"),
        )
    })
    output$histogram<-renderPlot({
        x_temp
        x<-subset(x_temp, format.Date(date, "%m")==input$monthsel)
        ggplot(data=x,
               aes(format(date, "%Y-%m"),y=clients)) +
            geom_bar(stat = "sum", fill="blue")+
            theme_minimal()+
            labs(x="Month")
    })
    output$timeseries<- renderPlotly({
        x_temp
        short.date = strftime(x_temp$date, "%Y/%m")
        dfx = aggregate(x_temp$clients ~ short.date, FUN = sum)
        plot1<-plot_ly(
            x=dfx$short.date,
            y=dfx$`x_temp$clients`,
            type='scatter',
            mode='lines'
        )
    })
    
    poll_server("main")
    read_results_server("results")
    food_server("main")
    food_results_server("results")

})

