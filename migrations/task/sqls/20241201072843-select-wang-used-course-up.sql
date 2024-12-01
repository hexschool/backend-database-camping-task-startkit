/* Replace with your SQL commands */
SELECT 
  u.id AS user_id,
  COUNT(cb.id) AS total
FROM 
  "COURSE_BOOKING" cb
JOIN 
  "USER" u ON cb.user_id = u.id
WHERE 
  u.name = '王小明' 
  AND cb.status IN ('上課中', '已完成') -- 條件：僅計算已使用的堂數
GROUP BY 
  u.id;
