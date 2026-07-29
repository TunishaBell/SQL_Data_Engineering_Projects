/*
🟩 Data Engineering Companies (1.11.1) - Problem
1.11 Joins
Problem Statement
Return recent Data Engineer postings from the data_jobs database and include the company name,
making sure only postings with a valid company are shown.

Task

Create a SQL file in the Lesson folder (e.g., 1.11.1.sql)
Write a query that returns, in order
job_id
job_title
name (aliased as company_name)
job_location
job_posted_date
Join job_postings_fact to company_dim
Join the tables to combine job postings with their corresponding company names
Ensure that only jobs with matching companies are included in the results
Filter the results using job_title_short for 'Data Engineer'
Order the final result set from newest to oldest based on job_posted_date
Hint
To execute your query in the file, select the entire statement, including the final;
and use the keybinding defined in the lesson (i.e., Shift+Enter)
Look for the shared company identifier column that appears in both tables to build your join
Think about a join condition that only keeps rows where the company identifier exists in 
both tables, so any job without a matching company is excluded from the results
*/

SELECT
  jpf.job_id,
  jpf.job_title_short,
  cd.name AS company_name,
  jpf.job_location,
  jpf.job_posted_date
FROM 
  job_postings_fact AS jpf
INNER JOIN
  company_dim AS cd
  ON jpf.company_id = cd.company_id
WHERE
    jpf.job_title_short = 'Data Engineer'
ORDER BY
    jpf.job_posted_date DESC;