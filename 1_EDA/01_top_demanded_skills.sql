/*
Question: What are the most in-demand skills for data engineers in the United States?

Purpose: Identify the top 10 skills with the highest demand that are remote in the U.S job market
 */

SELECT 
  sd.skills,
  COUNT(jpf.job_id) AS demand_count
FROM job_postings_fact AS jpf
  INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
  INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
  AND jpf.job_work_from_home = TRUE
  AND jpf.job_country = 'United States'
GROUP BY 
  sd.skills
ORDER BY 
  demand_count DESC
LIMIT 10;