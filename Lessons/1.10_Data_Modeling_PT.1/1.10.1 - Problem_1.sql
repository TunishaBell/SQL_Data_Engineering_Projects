/*
🟩 Identify Dimension Tables by Name (1.10.1) - Problem
1.10 Data Modeling - Pt. 1
Problem Statement
Explore the database metadata to identify all tables that are classified
 as "Dimension" tables (indicated by having 'dim' in their name).

Task

Create a SQL file in the Lesson folder (e.g., 1.10.1.sql)
Write a query against the system view information_schema.tables
Filter the results to show only rows where the table_name contains 
the text 'dim' anywhere in the string
Select all columns (*) for the matching tables
Hint
To execute your query in the file, select the entire statement, 
including the final ; and use the keybinding defined in the lesson (i.e., Shift+Enter)
You will need to use the LIKE operator combined with wildcard characters (%) to perform
 the pattern matching on the table_name column.
*/


SELECT *
FROM information_schema.tables
WHERE table_name LIKE '%dim%';
