--LEFT JOIN --> All records from the left and matching from the right
--(COMMON)
SELECT
    jpf.*,
    jpf.job_title_short,
    cd.company_id,
    cd.name as company_name,
    jpf.job_location
FROM 
    job_postings_fact as jpf
LEFT JOIN
    company_dim as cd
    ON jpf.company_id = cd.company_id
LIMIT 10;



--RIGHT JOIN --> All records from the right and matching from the left 
--(not common)
SELECT
    jpf.*,
    jpf.job_title_short,
    cd.company_id,
    cd.name as company_name,
    jpf.job_location
FROM 
    job_postings_fact as jpf
RIGHT JOIN
    company_dim as cd
    ON jpf.company_id = cd.company_id
LIMIT 10;


--INNER JOIN --> All matching records from both left and right
--(common)
SELECT
    jpf.*,
    jpf.job_title_short,
    cd.company_id,
    cd.name as company_name,
    jpf.job_location
FROM 
    job_postings_fact as jpf
INNER JOIN
    company_dim as cd
    ON jpf.company_id = cd.company_id
LIMIT 10;


--FULL OUTER JOIN --> All records from both left and right
--(NOT common)
SELECT
    jpf.*,
    jpf.job_title_short,
    cd.company_id,
    cd.name as company_name,
    jpf.job_location
FROM 
    job_postings_fact as jpf
FULL OUTER JOIN --FULL JOIN
    company_dim as cd
    ON jpf.company_id = cd.company_id
LIMIT 10;

--EXAMPLE
SELECT
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM 
    job_postings_fact as jpf
LEFT JOIN
    skills_job_dim as sjd
    ON jpf.job_id = sjd.job_id
LEFT JOIN
    skills_dim as sd
    ON sjd.skill_id = sd.skill_id
LIMIT 10;


SELECT
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM 
    job_postings_fact as jpf
INNER JOIN
    skills_job_dim as sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN
    skills_dim as sd
    ON sjd.skill_id = sd.skill_id
LIMIT 10;


SELECT
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM 
    job_postings_fact as jpf
FULL OUTER JOIN
    skills_job_dim as sjd
    ON jpf.job_id = sjd.job_id
FULL OUTER JOIN
    skills_dim as sd
    ON sjd.skill_id = sd.skill_id
LIMIT 10;