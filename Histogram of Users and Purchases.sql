WITH CTE AS
(
SELECT *,
RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS rank FROM user_transactions
)
SELECT  transaction_date, user_id, COUNT(product_id) AS purchase_count FROM CTE 
WHERE rank =1
GROUP BY user_id, transaction_date
ORDER BY transaction_date;