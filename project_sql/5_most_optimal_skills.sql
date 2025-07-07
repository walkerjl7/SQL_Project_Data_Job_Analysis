/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Concentrates on remote positions with specified salaries.
- Why? Target skills that offer job security (high demand) and financial benefits (high salaries),
offering a strategic insights for career development in data analysis
*/

WITH skills_demand AS (

SELECT s.skill_id, s.skills, COUNT(sd.job_id) as demand_count
FROM job_postings_fact t
INNER JOIN skills_job_dim sd
ON t.job_id = sd.job_id
INNER JOIN skills_dim s
ON s.skill_id = sd.skill_id
WHERE t.job_title_short = 'Data Analyst'
AND t.job_work_from_home = TRUE
AND t.salary_year_avg IS NOT NULL
GROUP BY s.skill_id

),

average_salary AS (

SELECT s.skill_id, s.skills, COUNT(sd.job_id) as demand_count, ROUND(AVG(t.salary_year_avg),0) as avg_salary
FROM job_postings_fact t
INNER JOIN skills_job_dim sd
ON t.job_id = sd.job_id
INNER JOIN skills_dim s
ON s.skill_id = sd.skill_id
WHERE t.job_title_short = 'Data Analyst'
AND t.job_work_from_home = TRUE
AND t.salary_year_avg IS NOT NULL
GROUP BY s.skill_id

)

SELECT sd.skill_id, sd.skills, sd.demand_count, a.avg_salary
FROM skills_demand sd
INNER JOIN average_salary as a
ON sd.skill_id = a.skill_id
WHERE sd.demand_count > 10
ORDER BY a.avg_salary DESC, sd.demand_count DESC