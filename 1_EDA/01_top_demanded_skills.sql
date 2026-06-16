/*
Question: What are the most in-demand skills for data engineers?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for data engineers
- Focus on remote job postings
- Why? Retrieves the top 10 skills with the highest demand in the remote job market,
    providing insights into the most valuable skills for data engineers seeking remote work
*/


SELECT 
    skd.skills,
    COUNT(jpf.*) AS demand
FROM 
    job_postings_fact jpf
INNER JOIN
    skills_job_dim sk ON jpf.job_id = sk.job_id
INNER JOIN
    skills_dim skd ON skd.skill_id = sk.skill_id    
WHERE 
    jpf.job_work_from_home = True 
    AND 
    jpf.job_title_short = 'Data Engineer'   
GROUP BY
    skd.skills    
ORDER BY
    demand DESC   
LIMIT 10;


/*
┌────────────┬────────┐
│   skills   │ demand │
│  varchar   │ int64  │
├────────────┼────────┤
│ sql        │  29221 │
│ python     │  28776 │
│ aws        │  17823 │
│ azure      │  14143 │
│ spark      │  12799 │
│ airflow    │   9996 │
│ snowflake  │   8639 │
│ databricks │   8183 │
│ java       │   7267 │
│ gcp        │   6446 │
└────────────┴────────┘
  10 rows   2 columns

*/