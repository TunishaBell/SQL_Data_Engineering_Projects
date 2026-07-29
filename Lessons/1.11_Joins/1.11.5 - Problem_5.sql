/*
🟥 In Demand Skills for >$100K Jobs (1.11.5) - Problem
1.11 Joins
Problem Statement
Identify the most frequently required skills for job postings in the data_jobs database that 
offer a yearly salary greater than $100,000.

Task

Create a SQL file in the Lesson folder (e.g., 1.11.5.sql)
Write a query that combines job_postings_fact with skills_job_dim and skills_dim to associate 
high-paying jobs with their specific skills
Select, in order:
job_title_short
skills
a count of job postings (aliased as job_count)
Filter the results so that the yearly salary (salary_year_avg) is greater than 100000
Group the results by job_title_short and skills so the count summarizes each unique skill combination
Order the final result set by the job_count from highest to lowest
Hint
To execute your query in the file, select the entire statement, including the final ; and use the 
keybinding defined in the lesson (i.e., Shift+Enter)
Think about the type of join that ensures you are only including jobs that have both salary data and
a corresponding skill, as the objective is to count the skills associated with these jobs.
Apply the salary filter in the WHERE clause.
*/


SELECT 
  jpf.job_title_short,
  sd.skills,
  COUNT(jpf.job_id) AS job_count
FROM 
  job_postings_fact AS jpf
INNER JOIN 
  skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
INNER JOIN 
  skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
WHERE 
  jpf.salary_year_avg > 100_000
GROUP BY 
  jpf.job_title_short,
  sd.skills
ORDER BY 
  job_count DESC;