WITH CTE AS 
(
SELECT 
*,
DENSE_RANK() OVER( PARTITION BY card_name ORDER BY issue_year,issue_month) AS rank
FROM monthly_cards_issued
)
SELECT card_name,issued_amount FROM CTE 
WHERE rank =1
ORDER BY issued_amount DESC