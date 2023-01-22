SELECT 
user_id, 
EXTRACT (DAYS FROM MAX(post_date)-MIN(post_date)) AS days_between 
FROM posts
WHERE EXTRACT(YEAR FROM post_date)=2021
GROUP BY 1
HAVING COUNT(post_date)>=2