SELECT 
ROUND(100 * 1.0 *(SELECT COUNT(*) FROM 
(SELECT pc.caller_id AS call, pc.receiver_id AS tocall,i.caller_id AS call1, i.country_id AS calllocation,p.caller_id AS tocall1, p.country_id AS receiverlocation  FROM phone_calls pc
LEFT JOIN phone_info i
ON pc.caller_id = i.caller_id
LEFT JOIN phone_info p 
ON pc.receiver_id=p.caller_id) as final
WHERE calllocation != receiverlocation) / (SELECT COUNT(*) FROM phone_calls) , 1) AS international_calls_pct