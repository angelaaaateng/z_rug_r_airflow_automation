## Sample R script for Airflow demo

# add package installs 
# install.packages('Hmisc')
# install.packages('tidyverse')

library(tidyverse)
library(Hmisc)

# Library
  # {
  #   library(tidyverse)
  #   library(Hmisc)
  #   rm(list = ls())
  # }

# Reading csv file
temp <- read.csv("~/Documents/GitHub/zlift_internal_airflow/annual-balance-sheets-2007-2021-provisional.csv")
# temp
# Prep/clean dataset
df <- temp %>% distinct() %>%
          mutate(Values2 = as.numeric(Values)) %>% 
          group_by(Period, Inst_sector, Asset_liability_code) %>% 
          summarise(Total = sum(Values2, na.rm = T)) %>% ungroup()
df
  # sum(as.numeric(df$Values), na.rm = T)
  # sum(df$Total)
  # unique(df$Period)
  # length(unique(df$Period))*length(unique(df$Inst_sector))
  ## expecting 19 by 23 matrix times 15 Periods = 285 obs
  

# Hmisc::describe(df)  
old_name <- unique(df$Asset_liability_code); old_name
new_name <- paste(unique(df$Asset_liability_code), "Tot", sep = "_"); new_name

df_spread <- df %>% spread(Asset_liability_code, Total) %>% 
        rename_with( ~ new_name, all_of(old_name))
  
asset_liability_masterlist <- temp %>% 
        distinct(Asset_liability_code, Descriptor) %>% 
        select(2, 1)
          
# Write tables
  
  # csv
write.csv(df_spread, "/Users/angelateng/Documents/GitHub/zlift_internal_airflow/Annual_Balance_Sheets20072021_AT.csv", row.names = F)

  # excel
out <- "/Users/angelateng/Documents/GitHub/zlift_internal_airflow/Annual_Balance_Sheets20072021_AT.xlsx"  
tables <- list("Annual Balance" = df,
                 "Asset & Liability Masterlist" = df_spread)
  
openxlsx::write.xlsx(tables, out)

# End  