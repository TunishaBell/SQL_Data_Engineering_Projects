/*
🟥 Skill Count for "Data" Roles (1.11.6) - Problem
1.11 Joins
Problem Statement
Measure how frequently each skill appears in “Data” roles in the data_jobs database,
starting from the skills lookup table

Task

Create a SQL file in the Lesson folder (e.g., 1.11.6.sql)
Write a query that starts from skills_dim and connects skills to job postings 
through the appropriate mapping table so each job can contribute one or more skills
Select, in order
skill_id
skills
a count of job postings as job_count
Filter the results so that only rows where job_title_short contains the word 'Data' are included
Group the results so that each skill appears once with its total job count
Order the final result set by job_count from highest to lowest
Hint
Think carefully about the direction and type of joins so that rows from the mapping and job postings
tables are kept even when a matching skill record is missing
Include rows where the skill name ends up as NULL so you can see cases where jobs are mapped
but do not have a corresponding entry in skills_dim
*/


SELECT 
  sd.skill_id,
  sd.skills,
  COUNT(jpf.job_id) AS job_count
FROM 
  skills_dim AS sd
RIGHT JOIN 
  skills_job_dim AS sjd
  ON sd.skill_id = sjd.skill_id
RIGHT JOIN 
  job_postings_fact AS jpf
  ON jpf.job_id = sjd.job_id
WHERE 
  jpf.job_title_short LIKE '%Data%'
GROUP BY 
  sd.skill_id,
  sd.skills
ORDER BY 
  job_count DESC;