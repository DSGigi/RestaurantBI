#data loading:
dati_clients<-function(dati_clients){
  url <- db_url
  dati <-(download_df(projectURL = url,fileName = "polls"))
  dati$date=as.Date(dati$date)
  Dati_clients<-as.data.frame(dati)
  clients34=Dati_clients$clients
  date=Dati_clients$date
  sum_cli=sum(Dati_clients$clients)
}

dati_foodcost<-function(dati_foodcost){
  url <- db_url
  dati2 <-(download_df(projectURL = url,fileName = "foodcost"))
  Dati_foodcost<-as.data.frame(dati2)
  print(Dati_foodcost)
}



#data loading:
dataframe<-function(dataframe){
  df <-(download_df(projectURL = db_url,fileName = "polls"))
  df$date=as.Date(df$date)
  DataFrame<-as.data.frame(df)
}

x_temp<-dataframe(DataFrame)



