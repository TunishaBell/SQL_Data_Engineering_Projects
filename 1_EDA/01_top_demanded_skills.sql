/*
 Question: What are the most in-demand skills for data engineers?
 - Join job postings to inner join table similar to query 2
 - Identify the top 10 in-demand skills for data engineers within the United States
 - Focus on remote job postings
 - Why? Retrieves the top 10 skills with the highest demand in the remote job market,
 providing insights into the most valuable skills for data engineers seeking remote work
 */

SELECT sd.skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
    AND jpf.job_country = 'United States'
GROUP BY sd.skills,
    ORDER BY demand_count DESC
LIMIT 10;
/*
Here's the breakdown of the most demanded skills for data engineers:
SQL and Python continue to be the most in-demand data engineering skills, showing up at the top of the list with the strongest overall demand. This reinforces that both languages remain the core foundation for most data engineering roles.
AWS and Azure also continue to be highly requested, which shows that cloud platforms are still essential for modern data infrastructure work. Employers clearly expect data engineers to be comfortable working in cloud environments.
Spark, Snowflake, and Databricks are also near the top, highlighting the importance of big data processing and modern analytics platforms. These tools continue to be especially valuable in data engineering pipelines and cloud-based workflows.
At the end of the list Java, Airflow, and Kafka all appear as important supporting skills. That suggests that data engineering roles are not just about querying and cloud tools, but also about orchestration, streaming, and broader software engineering knowledge.

Key takeaways:
 - SQL and Python remain the most essential skills for data engineers.
 - AWS and Azure are still core cloud requirements.
 - Spark, Snowflake, and Databricks show continued demand for modern data stack tools.
 - Airflow and Kafka remain important for workflow orchestration and streaming.
 - Java’s presence suggests some overlap between data engineering and general software engineering skills.
 
 ┌────────────┬──────────────┐
 │   skills   │ demand_count │
 │  varchar   │    int64     │
 ├────────────┼──────────────┤
 │ sql        │         9484 │
 │ python     │         8918 │
 │ aws        │         5750 │
 │ azure      │         4811 │
 │ spark      │         4023 │
 │ snowflake  │         3335 │
 │ databricks │         2885 │
 │ java       │         2648 │
 │ airflow    │         2340 │
 │ kafka      │         2210 │
 └────────────┴──────────────┘
 10 rows         2 columns  
 */