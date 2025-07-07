/*
Answer: What are the top skills based on salary?
-Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regarding of location.
- Why? It reveals how different skills impact salary levels for Data analysts and helps identify
the most finiancially rewarding skills to acquire or improve.
*/



SELECT s.skills, COUNT(sd.job_id) as demand_count, ROUND(AVG(t.salary_year_avg),0) as avg_salary
FROM job_postings_fact t
INNER JOIN skills_job_dim sd
ON t.job_id = sd.job_id
INNER JOIN skills_dim s
ON s.skill_id = sd.skill_id
WHERE t.job_title_short = 'Data Analyst'
AND t.job_work_from_home = TRUE
AND t.salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25