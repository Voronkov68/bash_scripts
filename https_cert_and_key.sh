#!/bin/bash

sudo apt-get update && sudo apt-get install openssl #obnovlenie paketov i ystanovka openssl

mkdir -p cert/  && cd cert/ #sozdanie directorii i perehod v nee

openssl genrsa -out server.key 4096 #sozdanie klutcha

openssl req -new -key server.key -out server.csr #sozdanie zaprosa na podpis

openssl x509 -req  -days 365 -in server.csr -signkey server.key -out server.crt #sozdanie sertifikata

openssl x509 -noout -text  -in server.crt  #vidid sertifikata

openssl x509 -noout -modulus -in server.crt | openssl md5 #vivod hecha setificata

openssl  rsa -noout -modulus -in server.key | openssl md5 #vivod hecha klucha


