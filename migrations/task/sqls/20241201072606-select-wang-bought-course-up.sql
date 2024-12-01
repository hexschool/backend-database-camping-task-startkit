/* Replace with your SQL commands */
SELECT 
  u.id AS user_id,
  SUM(cp.purchased_credits) AS total
FROM 
  "CREDIT_PURCHASE" cp
JOIN 
  "USER" u ON cp.user_id = u.id
WHERE 
  u.name = '王小明'
GROUP BY 
  u.id;
