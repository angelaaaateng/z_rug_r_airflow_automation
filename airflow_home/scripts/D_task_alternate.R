readtable <- read.table("/Users/angelateng/Documents/GitHub/zlift_internal_airflow/females.csv", sep= ",", header=TRUE)

write.csv(readtable[1:5, ],"/Users/angelateng/Documents/GitHub/zlift_internal_airflow/females_small.csv", row.names = FALSE)
