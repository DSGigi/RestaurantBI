food_ui <- function(im) {
  ns <- NS(im)

  tagList(
    fluidRow(
      column(
        width = 6,
        numericInput(ns("Rowmat"), "Row Materials:", value = 0),
        dateInput(ns("data"), "Data:", format="dd-mm-yyyy")
      ),
      textAreaInput(
        ns("commenti"),
        width = "100%",
        label = "Comments"
      ),
      actionButton(ns("submit2"), "Submit")
    )
  )

}

food_server <- function(im) {
  moduleServer(
    id = im,
    module = function(input, output, session) {

      observeEvent(input$submit2, {

        Rowmat <- input$Rowmat
        data <- input$data
        commenti <- input$commenti
        time <- Sys.time()
        url <- db_url

        future({
          upload_food(
            z = list(
              "Rowmat"=Rowmat,
              "data" = data,
              "time" = time
            ),
            projectURL = url,
            fileName3 = "foodcost"
          )
        })

      })

    }
  )
}