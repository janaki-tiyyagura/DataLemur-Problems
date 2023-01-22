WITH CTE AS
(
SELECT *, 
RANK() OVER (ORDER BY order_occurrences DESC) AS rank
FROM items_per_order
)
SELECT item_count AS mode FROM CTE
WHERE rank = 1