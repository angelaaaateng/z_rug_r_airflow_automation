# options(repos = c(CRAN = "https://cloud.r-project.org"))
# install.packages("ggplot2")
# pkgLoad <- function( packages = "favourites" ) {
#   
#   if( length( packages ) == 1L && packages == "favourites" ) {
#     packages <- c( "ggplot2"
#     )
#   }
#   
#   packagecheck <- match( packages, utils::installed.packages()[,1] )
#   
#   packagestoinstall <- packages[ is.na( packagecheck ) ]
#   
#   if( length( packagestoinstall ) > 0L ) {
#     utils::install.packages( packagestoinstall,
#                              repos = "http://cran.csiro.au"
#     )
#   } else {
#     print( "All requested packages already installed" )
#   }
#   
#   for( package in packages ) {
#     suppressPackageStartupMessages(
#       library( package, character.only = TRUE, quietly = TRUE )
#     )
#   }
#   
# }
# install.packages("ggplot2", dep=T)
# library(tidyverse)
# 
# library(ggplot2)

# Load data
data <- read.csv("/Users/angelateng/Documents/GitHub/zlift_internal_airflow/users.csv", header=TRUE)

# dataframe
output <- data[data$gender == 'male',]
write.csv(output,"/Users/angelateng/Documents/GitHub/zlift_internal_airflow/males.csv", row.names = FALSE)
# # Barplot
# p <- ggplot(data, aes(x = as.factor(gender), fill = gender)) +
#   geom_bar(stat = "count", position = "stack") +
#   labs(x = "Gender",
#        y = "Count")

# png("/Users/angelateng/Documents/GitHub/zlift_internal_airflow/counts_by_gender.png")
# print(p)
# dev.off()
