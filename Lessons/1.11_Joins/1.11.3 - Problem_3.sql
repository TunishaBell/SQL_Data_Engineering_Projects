/*
🟨 Jobs vs. Skills (1.11.3) - Problem
1.11 Joins
Problem Statement
Explore the relationship between job postings and skill mappings for roles in the
United States by combining all records from both the job postings table and the skills bridge table, regardless of whether they have a match.

Task

Create a SQL file in the Lesson folder (e.g., 1.11.3.sql)
Write a query that combines job_postings_fact and skills_job_dim to show all 
records from both tables
Select, in order
job_id
job_title_short
job_title
job_location
skill_id
Filter the results to only include rows where the country is United States
Order the final result set by job_id and then skill_id
Hint
To execute your query in the file, select the entire statement, including the final;
and use the keybinding defined in the lesson (i.e., Shift+Enter)
Look for the shared job identifier column that appears in both tables
(job_postings_fact and skills_job_dim) to build your join condition.
Think about a join condition that retains all rows from the left table and
all rows from the right table, ensuring that all records are present in the final result set, 
even when no match exists on the shared column.
*/

SELECT 
  jpf.job_id,
  jpf.job_title_short,
  jpf.job_title,
  jpf.job_location,
  sjd.skill_id
FROM 
  job_postings_fact AS jpf
FULL OUTER JOIN 
  skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
WHERE 
  jpf.job_country = 'United States'
ORDER BY 
  jpf.job_id,
  sjd.skill_id;