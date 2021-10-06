poll_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    fluidRow(
      column(
        width = 6,
        numericInput(ns("clients"), "Numer of clients:", value = 0),
        dateInput(ns("date"), "Date:", format="dd-mm-yyyy")
      ),
      column(
        width = 6,
        selectizeInput(
          ns("LunDin"),
          "Lunch vs Dinner:",
          choices = c("Lunch", "Dinner")),
        textAreaInput(
          ns("comments"),
          width = "100%",
          label = "Comments"
        ),
        actionButton(ns("submit"), "Submit")
      )
    )
  )
  
}

poll_server <- function(id) {
  moduleServer(
    id = id,
    module = function(input, output, session) {
      
      observeEvent(input$submit, {
        
        clients <- input$clients
        date <- input$date
        LunDin <- input$LunDin
        comments <- input$comments
        time <- Sys.time()
        url <- db_url
        
        future({
          upload_row(
            x = list(
              "clients" = clients,
              "date" = date,
              "LunDin" = LunDin,
              "comments" = comments,
              "time" = time
            ),
            projectURL = url,
            fileName = "polls"
          )
        })
        
      })
      
    }
  )
}