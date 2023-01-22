
SELECT age_bucket,
ROUND(SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END)/SUM(CASE WHEN activity_type IN ('send','open') THEN time_spent ELSE 0 END) * 100.0,2) AS send_perc,
ROUND(SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END)/SUM(CASE WHEN activity_type IN ('send','open') THEN time_spent ELSE 0 END) * 100.0,2) AS open_perc
FROM activities
JOIN age_breakdown 
ON activities.user_id = age_breakdown.user_id
GROUP BY age_bucket
