/*
Question: What are the most in-demand skills for data analyst jobs?
- Join job postings to inner join table similar to query 2.
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
-Why? Revtrieve the top 5 skills with the hights demand in the job market, 
providing insights to tht emost valuable job seekers.
*/


SELECT s.skills, COUNT(sd.job_id) as demand_count
FROM job_postings_fact t
INNER JOIN skills_job_dim sd
ON t.job_id = sd.job_id
INNER JOIN skills_dim s
ON s.skill_id = sd.skill_id
WHERE t.job_title_short = 'Data Analyst'
AND t.job_work_from_home = TRUE
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5