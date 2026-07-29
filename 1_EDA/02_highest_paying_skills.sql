/*
 Question: What are the highest-paying skills for data engineers in the United States?
 - Calculate the median salary for each skill required in data engineer positions
 - Focus on remote positions with specified salaries
 - Include skill frequency to identify both salary and demand
 - Why? Helps identify which skills command the highest compensation while also showing 
 how common those skills are, providing a more complete picture for skill development priorities
 */

SELECT sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
    AND jpf.job_country = 'United States'
GROUP BY sd.skills
HAVING COUNT(jpf.*) > 100
ORDER BY median_salary DESC
LIMIT 25;
/*
 Here's a breakdown of the highest-paying skills for Data Engineers in the United States:
 The highest-paying skills for data engineers in the U.S. are now led by Terraform at $189K median salary, followed closely by Confluence at $186.5K and GDPR at $183.5K. This shows that the top-paying skills are still heavily weighted toward specialized infrastructure, collaboration, and compliance tools rather than the most common day-to-day data stack skills.
 Airflow and Kubernetes remain especially important because they combine strong salaries with solid demand, at 2,340 and 1,056 postings respectively. Kafka and Git also stand out, showing that orchestration, streaming, and version control tools continue to be valuable in higher-paying roles.
 This suggests the highest-paying U.S. data engineering skills are less about one standout language and more about a broader mix of platform, workflow, and enterprise tools.
 
 Key Insights:
 - Terraform is the top-paying skill.
 - Confluence and GDPR rank unusually high, showing that enterprise and compliance-related skills can also command strong salaries.
 - Airflow, Kubernetes, and Kafka combine solid pay with much higher demand than most of the other top-paying skills.
 - This list is dominated by specialized tools, which means the highest salaries often come from a narrower skill set.
 - High-paying data engineering roles in the U.S. now appear to value a broader mix of infrastructure, orchestration, and collaboration tools.

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