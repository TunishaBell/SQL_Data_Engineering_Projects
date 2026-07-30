/*
Question: What are the most optimal skills for data engineers—balancing both demand and salary?

Purpose: This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately instead of letting rare, outlier skills distort the results. The natural log transformation ensures that both high-salary and widely in-demand skills surface as the most practical and valuable to learn for data engineering careers.
 */


SELECT 
  sd.skills,
  ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
  COUNT(jpf.job_id) AS demand_count,
  ROUND(LN(COUNT(jpf.job_id)), 1) AS ln_demand_count,
  ROUND((MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.job_id))) / 1_000_000, 2) AS optimal_score
FROM job_postings_fact AS jpf
  INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
  INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
  AND jpf.job_work_from_home = TRUE
  AND jpf.job_country = 'United States'
  AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
  sd.skills
HAVING 
  COUNT(jpf.job_id) > 100
ORDER BY
  optimal_score DESC
LIMIT 25;


 /*

 ┌────────────┬───────────────┬──────────────┬─────────────────┬───────────────┐
 │   skills   │ median_salary │ demand_count │ ln_demand_count │ optimal_score │
 │  varchar   │    double     │    int64     │     double      │    double     │
 ├────────────┼───────────────┼──────────────┼─────────────────┼───────────────┤
 │ terraform  │      189000.0 │          160 │             5.1 │          0.96 │
 │ python     │      137500.0 │          989 │             6.9 │          0.95 │
 │ airflow    │      155500.0 │          341 │             5.8 │          0.91 │
 │ aws        │      140000.0 │          677 │             6.5 │          0.91 │
 │ sql        │      130000.0 │          998 │             6.9 │           0.9 │
 │ spark      │      140000.0 │          413 │             6.0 │          0.84 │
 │ snowflake  │      137500.0 │          411 │             6.0 │          0.83 │
 │ kafka      │      150000.0 │          225 │             5.4 │          0.81 │
 │ git        │      150000.0 │          200 │             5.3 │          0.79 │
 │ azure      │      127731.0 │          424 │             6.0 │          0.77 │
 │ java       │      135000.0 │          253 │             5.5 │          0.75 │
 │ kubernetes │      155500.0 │          125 │             4.8 │          0.75 │
 │ scala      │      140000.0 │          202 │             5.3 │          0.74 │
 │ databricks │      132500.0 │          251 │             5.5 │          0.73 │
 │ redshift   │      130000.0 │          221 │             5.4 │           0.7 │
 │ nosql      │      135250.0 │          154 │             5.0 │          0.68 │
 │ pyspark    │      140000.0 │          131 │             4.9 │          0.68 │
 │ gcp        │      137500.0 │          144 │             5.0 │          0.68 │
 │ hadoop     │      135290.0 │          154 │             5.0 │          0.68 │
 │ r          │      136540.0 │          122 │             4.8 │          0.66 │
 │ docker     │      140000.0 │          108 │             4.7 │          0.66 │
 │ bigquery   │      132500.0 │          104 │             4.6 │          0.62 │
 │ sql server │      121920.0 │          152 │             5.0 │          0.61 │
 │ power bi   │      122282.0 │          133 │             4.9 │           0.6 │
 │ postgresql │      130000.0 │          103 │             4.6 │           0.6 │
 └────────────┴───────────────┴──────────────┴─────────────────┴───────────────┘
 25 rows                                                           5 columns  
 */