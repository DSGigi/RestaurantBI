food_results_ui <- function(id) {
  ns <- NS(id)

  tagList(
    dataTableOutput(ns("results2"))
  )
}

food_results_server <- function(id) {
  moduleServer(
    id = id,
    module = function(input, output2, session) {

      timer <- reactiveTimer(15000)

      data2 <- reactiveValues()

      observe({
        url <- db_url
        data2$results2 <- future({
          download_food(
            projectURL = url,
            fileName3 = "foodcost")
        })
        timer()

      })

      output2$results2 <- renderDataTable({
        data2$results2
      })

    }
  )
}