upload_row <- function(x, projectURL, fileName) {
  upload(x = x, projectURL = projectURL, directory = paste0("main/", fileName))
}

download_df <- function(projectURL, fileName) {
  rbindlist(
    download(projectURL = projectURL, fileName = paste0("main/", fileName))
  )
}

upload_food<- function(z, projectURL, fileName3){
  upload(x = z, projectURL = projectURL, directory = paste0("main/", fileName3))
}


download_food <- function(projectURL, fileName3) {
  rbindlist(
    download(projectURL = projectURL, fileName = paste0("main/", fileName3))
  )
}

