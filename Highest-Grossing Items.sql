SELECT category, product, total_spend
FROM 
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY category ORDER BY total_spend DESC) AS rank
FROM
(
SELECT  
category, 
product, 
SUM(spend) AS total_spend

FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY 1,2
) TEMP
) TEMP1
WHERE rank<=2;