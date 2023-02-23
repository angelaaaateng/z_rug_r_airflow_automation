# install.packages("ggplot2", repos = "http://cran.us.r-project.org")
# options(repos = c(CRAN = "https://cloud.r-project.org"))
# install.packages("ggplot2")
# install.packages("ggplot2", dep=T)
# library(tidyverse)
# 
# library(ggplot2)

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


# Load data
data <- read.csv("/Users/angelateng/Documents/GitHub/zlift_internal_airflow/users.csv", header=TRUE)

# # Barplot
# p <- ggplot(data, aes(x = as.factor(dob.age))) +
#   geom_bar(stat = "count", position = "stack", fill = "#FF6666") +
#   labs(x = "Age",
#        y = "Count")
# 
# png("/Users/angelateng/Documents/GitHub/zlift_internal_airflow/counts_by_age.png", width = 800, height = 400)
# print(p)
# dev.off()

output <- data[data$gender == 'female',]
write.csv(output,"/Users/angelateng/Documents/GitHub/zlift_internal_airflow/females.csv", row.names = FALSE)
