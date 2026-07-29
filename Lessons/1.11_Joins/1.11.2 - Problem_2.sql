/*
🟨 Data Engineer Skills in US (1.11.2) - Problem
1.11 Joins
Problem Statement
List all Data Engineer job postings in the United States that offer health insurance 
from the data_jobs database, and include all available associated skills for each job, even if a job has no skills listed.

Task

Create a SQL file in the Lesson folder (e.g., 1.11.2.sql)
Write a query that connects job_postings_fact to skills_job_dim and skills_dim to 
associate each job with its skills
Select, in order:
job_id (from job_postings_fact)
job_title (from job_postings_fact)
skills (from skills_dim)
job_country (from job_postings_fact)
Filter the results for:
Data Engineer jobs (use job_title_short)
Country of United States
Include health insurance benefits
Order the final result set from highest to lowest based on job_id
Hint
To execute your query in the file, select the entire statement, including the final; 
and use the keybinding defined in the lesson (i.e., Shift+Enter)
Look for the shared job identifier column between the job postings table and the 
bridge table, and the shared skill identifier between the bridge table and the skills 
lookup table to build your joins.
Think about a join condition that preserves all job postings that meet the filtering
 criteria, even if a job does not have an entry in the skills tables. 
 This ensures you list all relevant jobs, whether or not they have associated skills.
*/

SELECT 
  jpf.job_id,
  jpf.job_title,
  --sjd.skill_id,
  sd.skills,
  jpf.job_country
FROM 
  job_postings_fact AS jpf
LEFT JOIN 
  skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
LEFT JOIN 
  skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
WHERE 
  jpf.job_title_short = 'Data Engineer'
  AND jpf.job_country = 'United States'
  AND jpf.job_health_insurance = TRUE
ORDER BY 
  jpf.job_id DESC;