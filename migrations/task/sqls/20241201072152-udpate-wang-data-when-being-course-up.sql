/* Replace with your SQL commands */
UPDATE 
  "COURSE_BOOKING"
SET 
  join_at = '2024-11-25 14:01:59',
  status = '上課中'
WHERE 
  user_id = (SELECT id FROM "USER" WHERE name = '王小明')
  AND course_id = (
    SELECT id 
    FROM "COURSE" 
    WHERE user_id = (SELECT user_id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = '李燕容'))
    LIMIT 1
  )
  AND status != '課程已取消'
  AND join_at IS NULL;

