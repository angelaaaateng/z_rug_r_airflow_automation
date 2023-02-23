# for windows 
# install.packages("taskscheduleR")
# library(taskscheduleR)
# install.packages("cronR")
library(cronR)
sample_script <- "/Users/angelateng/Documents/GitHub/zlift_internal_airflow/sampleRscript.R"
cmd <- cron_rscript(sample_script)
cron_add(command = cmd, frequency = 'minutely', 
         id = 'test1', description = 'basic loading and printing of data', tags = c('lab', 'xyz'))
cron_njobs()

cron_ls()
