

## Sample R script for Airflow demo

# Library
  
  {
    library(tidyverse)
    library(Hmisc)
    rm(list = ls())
  }

# Reading csv file
  temp <- read.csv("C:/Lala/Z-Lift Solutions/Project/CEB/Internal/R Workspace/annual-balance-sheets-2007-2021-provisional.csv")

# Prep/clean dataset
  df <- temp %>% distinct() %>%
          mutate(Values2 = as.numeric(Values)) %>% 
          group_by(Period, Inst_sector, Asset_liability_code) %>% 
          summarise(Total = sum(Values2, na.rm = T)) %>% ungroup()
  
  # sum(as.numeric(df$Values), na.rm = T)
  # sum(df$Total)
  # unique(df$Period)
  # length(unique(df$Period))*length(unique(df$Inst_sector))
  ## expecting 19 by 23 matrix times 15 Periods = 285 obs
  
  Hmisc::describe(df)  
  old_name <- unique(df$Asset_liability_code); old_name
  new_name <- paste(unique(df$Asset_liability_code), "Tot", sep = "_"); new_name
  
  df_spread <- df %>% spread(Asset_liability_code, Total) %>% 
          rename_with( ~ new_name, all_of(old_name))
    
  asset_liability_masterlist <- temp %>% 
          distinct(Asset_liability_code, Descriptor) %>% 
          select(2, 1)
          
# Write tables
  
  # csv
  write.csv(df_spread, "C:/Lala/Z-Lift Solutions/Project/CEB/Internal/R Workspace/Annual Balance Sheets 2007-2021.csv", row.names = F)

  # excel
  out <- "C:/Lala/Z-Lift Solutions/Project/CEB/Internal/R Workspace/Annual Balance Sheets 2007-2021.xlsx"  
  tables <- list("Annual Balance" = df,
                 "Asset & Liability Masterlist" = df_spread)
  
  openxlsx::write.xlsx(tables, out)

# End  