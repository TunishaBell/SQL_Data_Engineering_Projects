/*
Question: What are the highest-paying skills for data engineers in the United States?

Purpose: Identifies which skills command the highest compensation while also showing how common those skills are, providing a more complete picture for skill development priorities
*/

SELECT 
  sd.skills,
  ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
  COUNT(jpf.job_id) AS demand_count
FROM job_postings_fact AS jpf
  INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
  INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
  AND jpf.job_work_from_home = TRUE
  AND jpf.job_country = 'United States'
GROUP BY 
  sd.skills
HAVING 
  COUNT(jpf.job_id) > 100
ORDER BY 
  median_salary DESC
LIMIT 25;