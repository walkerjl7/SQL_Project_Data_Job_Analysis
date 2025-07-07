/*
Question: What are the top-paying data analyst jobs?
-Identify the top 10 highest Data Analyst roles that are available remotely.
-Focuses on the job postings with the specified salaries (remove nulls).
-Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employement opportunites. 
*/

SELECT f.job_id, f.job_title, f.job_location, f.job_schedule_type, f.salary_year_avg, f.job_posted_date,
d.name AS company_name
FROM job_postings_fact f
LEFT JOIN company_dim d
ON f.company_id = d.company_id
WHERE job_title_short = 'Data Analyst'
  AND job_location = 'Anywhere'
  AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10