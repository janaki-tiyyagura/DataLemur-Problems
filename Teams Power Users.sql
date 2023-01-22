SELECT sender_id, COUNT(content) AS message_count
FROM messages
WHERE sent_date BETWEEN '08/01/2022' AND '08/31/2022'
GROUP BY sender_id
ORDER BY 2 DESC
LIMIT 2