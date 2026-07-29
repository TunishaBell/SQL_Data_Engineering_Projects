/*
🟥 "Data" Jobs Skill Count (1.11.4) - Problem
1.11 Joins
Problem Statement
Determine the frequency of each skill mentioned across all job postings where the job title
contains the word "Data" in the data_jobs database.

Task

Create a SQL file in the Lesson folder (e.g., 1.11.4.sql)
Write a query that connects job_postings_fact to skills_job_dim and then to skills_dim to
associate job postings with their skills
Select, in order
job_title_short
skill_id
skills
a count of job postings (aliased as job_count)
Filter the results so that the job_title_short contains the word 'Data'
Group the results by the short job title, skill ID, and skill name so the count summarizes
each unique skill combination
Order the final result set by the job count from highest to lowest
Hint
To execute your query in the file, select the entire statement, including the final;
and use the keybinding defined in the lesson (i.e., Shift+Enter)
Think about the type of join that ensures all job postings matching the filter criteria
are included in the results, even if they have no associated skill mapping.
In the WHERE clause, remember to use pattern matching to find all job titles that include
the string 'Data'.
*/

SELECT 
  jpf.job_title_short,
  sd.skill_id,
  sd.skills,
  COUNT(jpf.job_id) AS job_count
FROM 
  job_postings_fact AS jpf
LEFT JOIN 
  skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
LEFT JOIN 
  skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
WHERE 
  jpf.job_title_short LIKE '%Data%'
GROUP BY 
  jpf.job_title_short,
  sd.skill_id,
  sd.skills
ORDER BY 
  job_count DESC;