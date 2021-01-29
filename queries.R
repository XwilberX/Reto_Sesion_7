# Reto 1 Sesion 7
install.packages("DBI")
install.packages("RMySQL")

library(dplyr)
library(DBI)
library(RMySQL)
library(ggplot2)

# Una vez que se tengan las librerias necesarias se procede a la lectura 
# (podría ser que necesites otras, si te las solicita instalalas y cargalas), 
# de la base de datos de Shiny la cual es un demo y nos permite interactuar con 
# este tipo de objetos. El comando dbConnect es el indicado para realizar la 
# lectura, los demás parametros son los que nos dan acceso a la BDD.

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")
  
  
  
  
DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")

perc.sph <- DataDB %>% filter(Language == "Spanish")


ggplot(perc.sph, aes(x=Percentage,y=CountryCode, fill= IsOfficial))+geom_bar(stat="identity")


