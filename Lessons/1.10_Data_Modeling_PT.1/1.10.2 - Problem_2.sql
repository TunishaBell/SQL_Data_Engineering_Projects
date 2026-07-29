/*
🟨 Identifying Composite Key Constraints (1.10.2) - Problem
1.10 Data Modeling - Pt. 1
Problem Statement
Identify tables in the database that utilize Composite Keys 
(keys constructed from multiple columns rather than a single column).
 You will analyze the system's metadata to find constraints that bind more than one column together.

Task

Create a SQL file in the Lesson folder (e.g., 1.10.2.sql)
Write a query against the information_schema.key_column_usage table
Filter the results to only include the current database (table_catalog = 'data_jobs')
Group the results by table_name and constraint_name
Select the following columns:
table_name
constraint_name
The count of columns associated with each constraint (aliased as constraint_name_count)
Filter the grouped results to show only those where the count of columns 
is greater than 1 (indicating a composite key)
Hint
Use the HAVING clause to filter aggregated results (the count) after grouping.
A standard primary key affects one column, so its count is 1. 
If a constraint appears multiple times in key_column_usage for the same table, 
it means it is binding multiple columns together.
*/

SELECT table_name, constraint_name, count(constraint_name) as constraint_name_count
FROM information_schema.key_column_usage
WHERE table_catalog = 'data_jobs'
GROUP BY table_name, constraint_name
HAVING count(constraint_name) > 1; 
