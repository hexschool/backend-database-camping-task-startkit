/* Replace with your SQL commands */
INSERT INTO "COURSE_BOOKING" (user_id, course_id, booking_at, status)
VALUES (
  (SELECT id FROM "USER" WHERE name = '王小明'),
  (SELECT id FROM "COURSE" WHERE user_id = (SELECT user_id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = '李燕容'))),
  '2024-11-24 17:10:25',
  '即將授課'
);
