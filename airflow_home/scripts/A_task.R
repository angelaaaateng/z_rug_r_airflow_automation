# install.packages("httr")
# install.packages("jsonlite")
library(httr)
library(jsonlite)

res = GET(
  url = "https://randomuser.me/api/",
  query = list(
    results=200,
    nat="ca",
    inc="gender,name,dob"
   )
)
data = fromJSON(content(res, "text"))
write.csv(data$results,"/Users/angelateng/Documents/GitHub/zlift_internal_airflow/users.csv", row.names = FALSE)