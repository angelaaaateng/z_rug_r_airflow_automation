readtable <- read.table("/Users/angelateng/Documents/GitHub/zlift_internal_airflow/females.csv", sep= ",", header=TRUE)
write.csv(readtable[1:5, ],"/Users/angelateng/Documents/GitHub/zlift_internal_airflow/females_small.csv", row.names = FALSE)
readtable2 <- read.table("/Users/angelateng/Documents/GitHub/zlift_internal_airflow/males.csv", sep= ",", header=TRUE)
write.csv(readtable2[1:5, ],"/Users/angelateng/Documents/GitHub/zlift_internal_airflow/males_small.csv", row.names = FALSE)
