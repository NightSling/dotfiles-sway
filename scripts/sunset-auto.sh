#!/bin/bash
location=$(curl -s https://ipinfo.io/loc)   # gets your lat,lon
lat=$(echo $location | cut -d',' -f1)
lon=$(echo $location | cut -d',' -f2)

wlsunset -l "$lat" -L "$lon"
