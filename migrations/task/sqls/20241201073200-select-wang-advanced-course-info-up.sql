/* Replace with your SQL commands */
SELECT 
  cp.user_id,
  (cp.total_credit - COALESCE(cb.used_credit, 0)) AS remaining_credit
FROM 
  (
    -- 用戶的購買總堂數
    SELECT 
      u.id AS user_id,
      SUM(cp.purchased_credits) AS total_credit
    FROM 
      "CREDIT_PURCHASE" cp
    JOIN 
      "USER" u ON cp.user_id = u.id
    WHERE 
      u.name = '王小明'
    GROUP BY 
      u.id
  ) AS cp
LEFT JOIN 
  (
    -- 用戶的已使用堂數
    SELECT 
      u.id AS user_id,
      COUNT(cb.id) AS used_credit
    FROM 
      "COURSE_BOOKING" cb
    JOIN 
      "USER" u ON cb.user_id = u.id
    WHERE 
      u.name = '王小明' 
      AND cb.status IN ('上課中', '已完成') -- 只計算已使用的堂數
    GROUP BY 
      u.id
  ) AS cb
ON 
  cp.user_id = cb.user_id;
