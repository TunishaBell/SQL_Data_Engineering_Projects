/*
🟨 Viewing Wide Metadata Tables (1.10.3) - Problem
1.10 Data Modeling - Pt. 1
Problem Statement
Explore how to change the output display mode in the DuckDB terminal to view wide tables that 
have hidden columns.

Task

Create a SQL file in the Lesson folder (e.g., 1.10.3.sql)
Write a query that selects all columns from information_schema.tables for the table 
'job_postings_fact'
Run the query to see the standard output (notice if columns are hidden)
In the terminal, type .mode line and press Enter to switch to vertical view
Run the query again to see the full details of every column
In the terminal, type .mode duckbox and press Enter to reset the view to the default table format
Hint
To execute your query in the file, select the entire statement, including the final ; 
and use the keybinding defined in the lesson (i.e., Shift+Enter)
The commands starting with a dot (like .mode line) are terminal commands, not SQL. 
You must type them directly into the terminal prompt where it says D, not inside your SQL file.
*/

SELECT *
FROM information_schema.tables
WHERE table_name = 'job_postings_fact';
