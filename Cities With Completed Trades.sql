SELECT users.city, COUNT(trades.status) AS total_orders FROM users
LEFT JOIN trades
ON users.user_id = trades.user_id
WHERE trades.status = 'Completed'
GROUP BY city
ORDER BY 2 DESC
LIMIT 3