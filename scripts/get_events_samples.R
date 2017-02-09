# pull repo samples from Google BigQuery and write to RDS and CSV

library(dplyr)
library(bigrquery)

project <- "bonnyci-github-archive"
num_samples <- 1
sample_size <- 100

# Get the high end of the range
high_count_sql <-
  'select count(*) as count from [bonnyci-github-archive:ci_plunder_events.high_participation_repo_id]'
high_count <- query_exec(high_count_sql, project = project)

# Get the high end of the range
med_count_sql <-
  'select count(*) as count from [bonnyci-github-archive:ci_plunder_events.high_participation_repo_id]'
med_count <- query_exec(med_count_sql, project = project)

for (sample_number in range(1,num_samples)){
  # Generate the random numbers and build the data sets
  high_sample_ids <- sort(sample(high_count$count, sample_size, replace=FALSE))
  med_sample_ids <- sort(sample(high_count$count, sample_size, replace=FALSE))
  
  # Get the list of project names so we can get the dataz
  high_sample_repos_sql <-
    paste('SELECT repo_name FROM [bonnyci-github-archive:ci_plunder_events.high_participation_repo_id] WHERE repo_id IN(',
          paste(as.character(high_sample_ids), collapse=", "),
          ')',
          sep=" ")
  med_sample_repos_sql <-
    paste('SELECT repo_name FROM [bonnyci-github-archive:ci_plunder_events.med_participation_repo_id] WHERE repo_id IN(',
          paste(as.character(med_sample_ids), collapse=", "),
          ')',
          sep=" ")
  
  high_sample_repos <- query_exec(high_sample_repos_sql, project = project)
  med_sample_repos <- query_exec(med_sample_repos_sql, project = project)
  
  sample_repos <- bind_rows(high_sample_repos, med_sample_repos)
  
  # Get the actual data for each repo
  sample_sql <-
    paste("SELECT * FROM [bonnyci-github-archive:ci_plunder_events.participation_rate_per_repo] WHERE repo_name IN('",
          paste(as.character(sample_repos$repo_name), collapse="','"),
          "')", sep="")
  sample <- query_exec(sample_sql, project = project)
  
  sample_file <- paste("repos_sample_", sample_number, sep="")
  saveRDS(sample, paste(sample_file, ".rds", sep=""))
  write.csv(sample, paste(sample_file, ".csv", sep=""))
}