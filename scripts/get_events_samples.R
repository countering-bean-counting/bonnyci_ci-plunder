# pull repo samples from Google BigQuery and write to RDS and CSV

library(dplyr)
library(bigrquery)

project <- "bonnyci-github-archive"
num_samples <- 5
sample_size <- 100
participation_rate <- "low"

repo_count_sql <-
  paste('select count(*) as count from [bonnyci-github-archive:ci_plunder_events.', participation_rate, '_participation_repo_id]', sep="")
repo_count <- query_exec(repo_count_sql, project = project)



for (sample_number in 1:num_samples){
  # Generate the random numbers and build the data sets
  sample_ids <- sort(sample(repo_count$count, sample_size, replace=FALSE))
  
  # Get the list of project names so we can get the dataz
  sample_repos_sql <-
    paste(paste('SELECT repo_name FROM [bonnyci-github-archive:ci_plunder_events.', participation_rate, '_participation_repo_id] WHERE repo_id IN(', sep=""),
          paste(as.character(sample_ids), collapse=", "),
          ')',
          sep=" ")
  
  sample_repos <- query_exec(sample_repos_sql, project = project)
  
  # Get the actual data for each repo
  sample_sql <-
    paste("SELECT * FROM [bonnyci-github-archive:ci_plunder_events.repos_participation_rate_event_types_summary] WHERE repo_name IN('",
          paste(as.character(sample_repos$repo_name), collapse="','"),
          "')", sep="")
  sample <- query_exec(sample_sql, project = project)
  
  sample_file <- paste(participation_rate, "_repos_sample_", sample_number, sep="")
  saveRDS(sample, paste(sample_file, ".rds", sep=""))
  write.csv(sample, paste(sample_file, ".csv", sep=""))
}