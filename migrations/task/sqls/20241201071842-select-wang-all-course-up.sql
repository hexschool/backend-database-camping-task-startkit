/* Replace with your SQL commands */
SELECT 
  cb.id AS booking_id,
  u.name AS user_name,
  c.name AS course_name,
  cb.booking_at,
  cb.status,
  cb.cancelled_at
FROM 
  "COURSE_BOOKING" cb
JOIN 
  "USER" u ON cb.user_id = u.id
JOIN 
  "COURSE" c ON cb.course_id = c.id
WHERE 
  u.name = '王小明';
