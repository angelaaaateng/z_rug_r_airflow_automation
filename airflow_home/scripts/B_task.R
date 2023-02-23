# install.packages("ggplot2")
library(ggplot2)

# Load data
data <- read.csv("/Users/angelateng/Documents/GitHub/zlift_internal_airflow/users.csv", header=TRUE)

# Barplot
p <- ggplot(data, aes(x = as.factor(gender), fill = gender)) +
  geom_bar(stat = "count", position = "stack") +
  labs(x = "Gender",
       y = "Count")

png("/Users/angelateng/Documents/GitHub/zlift_internal_airflow/counts_by_gender.png")
print(p)
dev.off()
