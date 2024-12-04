/* Replace with your SQL commands */
UPDATE "COURSE_BOOKING"
SET 
  cancelled_at = '2024-11-24 17:00:00',
  status = '課程已取消'
WHERE 
  user_id = (SELECT id FROM "USER" WHERE name = '王小明')
  AND course_id = (
    SELECT id 
    FROM "COURSE" 
    WHERE user_id = (SELECT user_id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = '李燕容'))
    AND start_at = '2024-11-25 14:00:00'
    LIMIT 1
  );
