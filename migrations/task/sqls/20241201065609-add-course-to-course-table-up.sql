/* Replace with your SQL commands */
INSERT INTO "COURSE" (user_id, skill_id, name, start_at, end_at, max_participants, meeting_url)
VALUES (
  (SELECT user_id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = '李燕容')), -- 教練ID
  (SELECT id FROM "SKILL" WHERE name = '重訓'), -- 專長ID
  '重訓基礎課', -- 課程名稱
  '2024-11-25 14:00:00', -- 授課開始時間
  '2024-11-25 16:00:00', -- 授課結束時間
  10, -- 最大授課人數
  'https://test-meeting.test.io' -- 授課連結
);
