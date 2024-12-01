/* Replace with your SQL commands */
INSERT INTO "COURSE_BOOKING" (course_id, user_id, booking_at, status)
VALUES
(
  -- 第一筆：王小明預約課程
  (SELECT id FROM "COURSE" WHERE user_id = (SELECT user_id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = '李燕容'))),
  (SELECT id FROM "USER" WHERE name = '王小明'),
  '2024-11-24 16:00:00',
  '即將授課'
),
(
  -- 第二筆：好野人預約課程
  (SELECT id FROM "COURSE" WHERE user_id = (SELECT user_id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = '李燕容'))),
  (SELECT id FROM "USER" WHERE name = '好野人'),
  '2024-11-24 16:00:00',
  '即將授課'
);
