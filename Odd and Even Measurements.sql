WITH CTE AS 
(
SELECT CAST(measurement_time AS DATE) AS measurement_day, measurement_value,
ROW_NUMBER() OVER(PARTITION BY CAST(measurement_time AS DATE) ORDER BY measurement_time) AS odd_even FROM measurements
)
SELECT measurement_day,
SUM(CASE WHEN odd_even%2=1 THEN measurement_value ELSE 0 END) AS odd_sum,
SUM(CASE WHEN odd_even%2=0 THEN measurement_value ELSE 0 END) AS even_sum
FROM CTE 
GROUP BY 1