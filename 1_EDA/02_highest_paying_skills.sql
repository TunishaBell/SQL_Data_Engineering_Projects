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

/*
 ┌────────────┬───────────────┬──────────────┐
 │   skills   │ median_salary │ demand_count │
 │  varchar   │    double     │    int64     │
 ├────────────┼───────────────┼──────────────┤
 │ terraform  │      189000.0 │         1053 │
 │ confluence │      186500.0 │          222 │
 │ gdpr       │      183500.0 │          158 │
 │ spring     │      175500.0 │          183 │
 │ graphql    │      160000.0 │          110 │
 │ mongo      │      155527.0 │          115 │
 │ airflow    │      155500.0 │         2340 │
 │ kubernetes │      155500.0 │         1056 │
 │ jupyter    │      155000.0 │          136 │
 │ ruby       │      155000.0 │          220 │
 │ typescript │      155000.0 │          124 │
 │ bitbucket  │      155000.0 │          137 │
 │ golang     │      155000.0 │          147 │
 │ ansible    │      153000.0 │          134 │
 │ kafka      │      150000.0 │         2210 │
 │ git        │      150000.0 │         1576 │
 │ redis      │      150000.0 │          136 │
 │ react      │      148250.0 │          158 │
 │ looker     │      145750.0 │          468 │
 │ c          │      143250.0 │          197 │
 │ splunk     │      140750.0 │          122 │
 │ jira       │      140000.0 │          602 │
 │ aws        │      140000.0 │         5750 │
 │ dynamodb   │      140000.0 │          402 │
 │ word       │      140000.0 │          289 │
 └────────────┴───────────────┴──────────────┘
 25 rows                         3 columns
 
 */