SELECT COUNT(policy_holder_id) AS member_count FROM
(
SELECT policy_holder_id,COUNT(case_id) FROM callers
GROUP BY policy_holder_id
HAVING COUNT(case_id) >=3
) AS TEMP