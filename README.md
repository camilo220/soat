# SOAT Manager

This application will allow you to manage a service of sale of compulsory insurance SOAT, in addition it will give the user who wants to acquire a soat the possibility of seeing the status of all the products acquired.

## assumptions 

This app shloud be base on the document [http://www.fasecolda.com/files/1114/8406/4009/Tarifas_soat_2016C004-09.pdf](TARIFAS MÁXIMAS COMERCIALES DEL SOAT 2017), but this document seems to be more informative than referencial that's why the logical of this project use [https://docs.google.com/spreadsheets/d/1WWjdMF49DrCPj1e5xW6j0xX3V-uq5pWlrTF-IBwhmzI/edit?usp=sharing](this one) (estructural modifications made to the principal document, all the information is the same).

## Development

### System dependencies
* Ruby version: 2.3.4
* Rails version: 5.1.2
  
### Setup
* install al the gems 
  ``bundle install ``

* DB setup
``rails db:create && rails db:migrate``
and if you want run the seeds
``rails db:seed``