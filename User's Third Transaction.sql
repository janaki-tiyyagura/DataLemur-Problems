WITH CTE AS
(
SELECT * ,
ROW_NUMBER()  OVER(PARTITION BY user_id ORDER BY transaction_date) AS history
FROM transactions
)
SELECT user_id, spend,transaction_date FROM CTE 
WHERE history = 3;