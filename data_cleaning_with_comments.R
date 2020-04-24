
#######################
###  Data Cleaning  ###
#######################

## 1. Load libraries

# Data Table for faster computing
library(data.table) # CORE
library(dtplyr)     # data.table + dplyr

# This project will use the package `data.table()` which handles reading data much faster than `data.frame()` or `tibble()`. 
# In order to compromise with writing new syntax, I am also using the package `dtplyr()` 
#   which is a wrapper for `data.table()` but with the same syntax as `dplyr()`. '

# Data Wrangling
library(readr)
library(stringr)    # string manipulation
library(dplyr)
library(tidyr) 
library(magrittr)   # pipes %>% 
library(lubridate)  # handilng dates

# Plotting
library(ggplot2)
library(colorspace)

## 2. Cleaning Scripts

# Load data
df <- fread("la_arrest.csv")

# Select columns of interest and rename them
df <- df[,.(arrest_date=`Arrest Date`,               # [date] (mm/dd/yyyy)
            time=`Time`,                             # [num] Range: 0000-2400
            area_name=`Area Name`,                   # [fct] 21 unique LA patrol areas
            age=`Age`,                               # [num] Range: 0-97
            sex=`Sex Code`,                          # [fct] Female/Male
            descent=`Descent Code`,                  # [fct] 19 unique descents
            charge_group=`Charge Group Description`, # [fct] 28 unique charge groups
            arrest_type=`Arrest Type Code`,          # [fct] 5 unique arrest types
            rep_dist=`Reporting District`,           # [fct] 1352 unique LAPD reporting districts
            location=`Location`)                     # [num] (Latitude, Longitude)
         ]  

# Split location to latitude and longitude
df <- df %>% 
  cbind(df[,(location)] %>% 
          # Before: (lat, long) - 1 column
          str_replace_all("[()]","") %>% 
          str_split_fixed(", ", n=2) %>% 
          # After: lat | long - 2 columns
          as.data.table() %>% 
          
          # Rename columns
          transmute(latitude = as.numeric(V1), 
                    longitude = as.numeric(V2)) %>% 
          as.data.table()
  ) %>% 
  # Remove location data
  select(-location)

# Change arrest_date to date object
df <- df[, `:=`(arrest_date = mdy(arrest_date))] %>% 
  as.data.table()

# Save cleaned data
fwrite(df, "la_arrest2.csv")

## The csv file we have in the repository is "la_arrest2.csv" 100MB before compressing as a zip file. 