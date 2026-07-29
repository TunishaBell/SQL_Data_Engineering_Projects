/*
 Question: What are the most optimal skills for data engineers—balancing both demand and salary?
 - Create a ranking column that combines demand count and median salary to identify the most valuable skills.
 - Focus only on remote Data Engineer positions with specified annual salaries.
 - Why?
 - This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately instead of letting rare, outlier skills distort the results.
 - The natural log transformation ensures that both high-salary and widely in-demand skills surface as the most practical and valuable to learn for data engineering careers.
 */


SELECT sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS demand_count,
    ROUND(LN(COUNT(jpf.*)), 1) AS ln_demand_count,
    ROUND(
        (MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*))) / 1_000_000,
        2
    ) AS optimal_score
FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
    AND jpf.job_country = 'United States'
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY sd.skills
HAVING COUNT(jpf.*) > 100
ORDER BY optimal_score DESC
LIMIT 25;
 /*

Here’s a breakdown of the most optimal skills for Data Engineers, based on both high demand and high salaries:

Top Skills by Optimal Score:
 - Terraform leads the list with a median salary of $189K and 160 postings, making it the highest in the overall "optimal score". 
 - Python follows with a median salary of $137.5K and 989 postings, while SQL comes in at $130K with 998 postings, dominating demand with postings over 980 each showing that they still remains as the most reliable foundation skills for data engineering careers.
 - Airflow also stands out with a $155.5K median salary and 341 postings, and AWS remains highly valuable at $140K with 677 postings. 
 - Spark, Snowflake, and Kafka also perform well, combining strong compensation with meaningful demand.

DevOps & Engineering Tools:
 - Airflow ($155.5K), Kubernetes ($155.5K), Docker ($140K) stand out for their mix of demand and top median salaries
 - Git ($150K/200 postings) has broad utility and competitive compensation.


Noteworthy Languages:
 - Java ($135K/ 253 postings) and Scala ($140K/202 postings) remain strong choices for well-paid data engineering roles.
 - Go ($140K/113 postings) is another programming language with excellent compensation.

Databases & Cloud:
 - Redshift ($130K/221 postings), Hadoop ($135K/154 postings), NoSQL ($134K/154 postings), and GCP ($137.5K/144 postings) add to a well-rounded data engineering skill set.
 - R, Pyspark, and BigQuery each deliver competitive salaries and meet the threshold for demand.

Summary:
Skills that consistently appear near the top balance a strong combination of market demand (job security) and financial benefit. Python, SQL, AWS, Spark, Airflow, and Azure are particularly strategic for both immediate opportunities and longer-term career growth in data engineering.

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