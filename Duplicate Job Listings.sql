SELECT COUNT(*) AS co_w_duplicate_jobs
FROM 
(SELECT company_id FROM job_listings
GROUP BY company_id, title, description
HAVING COUNT(title)>=2) temp