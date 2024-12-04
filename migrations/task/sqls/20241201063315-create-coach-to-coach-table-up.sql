/* Replace with your SQL commands */
INSERT INTO "COACH" (user_id, experience_years)
VALUES
(
  (SELECT id FROM "USER" WHERE name = '李燕容'),
  2
),
(
  (SELECT id FROM "USER" WHERE name = '肌肉棒子'),
  2
),
(
  (SELECT id FROM "USER" WHERE name = 'Q太郎'),
  2
)
ON CONFLICT (user_id) DO NOTHING;