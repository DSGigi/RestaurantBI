

shinyUI(
    dashboardPage(skin="blue",
                  dashboardHeader(title=HTML("Restaurant Managment BI"), disable=FALSE, titleWidth=550),
                  dashboardSidebar(
                      sidebarMenu(id='sidebar', style = "position: relative; overflow: visible;",
                                  menuItem("Dashboard", tabName="dashboard", icon=icon("tachometer-alt")),
                                  menuSubItem("Data input", tabName="data_input"),
                                  menuSubItem("Purchase", tabName="Purchase"),
                                  menuItem("Detalied Analysis", tabName="detanalysis"),
                                  menuItem("Raw Data", tabName = "rawdata")
                      )),
                  dashboardBody(
                      tabItems(
                          tabItem(tabName = "dashboard",
                                  fluidRow(
                                      (box(plotOutput(outputId="histogram"))),
                                      column(width=10,
                                             selectInput("monthsel","Select your month:", choices= c("Gennaio"=01, "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", Dicembre="12"))
                                      ),
                                      column(width=2,
                                             dataTableOutput("seasonal_diff"))),
                                  fluidRow(
                                      column(width=10,
                                             valueBoxOutput("clients")
                                      )),
                                  fluidRow(
                                      column(width=10,
                                             plotlyOutput("timeseries")
                                      ))),
                          tabItem(tabName="data_input",
                                  h1("Insert your clients data"),
                                  fluidRow(
                                      column(width = 6,
                                             poll_ui("main")
                                      ),
                                      column(width = 10,
                                             read_results_ui("results")
                                      )
                                  )),
                          tabItem(tabName="Purchase",
                                  h1("Purchase"),
                                  fluidRow(
                                      column(width = 6,
                                             food_ui("main")
                                      ),
                                      column(width = 10,
                                             food_results_ui("results")
                                      )
                                  )),
                          tabItem(tabName="detanalysis",
                                  h1("Detalied Analysis"))
                      ),
                  )

    )
)
