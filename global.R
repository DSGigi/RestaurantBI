library(shinydashboard)
library(shiny)
library(fireData)
library("promises")
library("future")
library(data.table)
library(shinydashboard)
library("rjson")
library("shinyWidgets")
library(ggplot2)
library(scales)
library(dplyr)
library(plotly)
library(curl)

Api_key="AIzaSyCH3b43dZneUhqqxxrKcNKi7037PuCpEE4"
db_url="https://project-9a0f9-default-rtdb.firebaseio.com/"


plan(multisession)

lapply(list.files("R"), FUN = function(x) source(paste0("R/", x)))

