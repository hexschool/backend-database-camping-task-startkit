/* Replace with your SQL commands */
-- Step 1: 新增技能資料到 SKILL 資料表（如果尚未存在）
INSERT INTO "SKILL" (name)
VALUES
('重訓'),
('瑜伽'),
('有氧運動'),
('復健訓練')
ON CONFLICT (name) DO NOTHING; -- 避免重複插入已存在的技能

-- Step 2: 新增教練專長到 COACH_LINK_SKILL 資料表
INSERT INTO "COACH_LINK_SKILL" (coach_id, skill_id)
VALUES
-- 所有教練都有重訓專長
(
  (SELECT id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = '李燕容')),
  (SELECT id FROM "SKILL" WHERE name = '重訓')
),
(
  (SELECT id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = '肌肉棒子')),
 (SELECT id FROM "SKILL" WHERE name = '重訓')
 ),
(
  (SELECT id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = 'Q太郎')),
 (SELECT id FROM "SKILL" WHERE name = '重訓')
 ),
-- 肌肉棒子的瑜伽專長
(
  (SELECT id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = '肌肉棒子')),
 (SELECT id FROM "SKILL" WHERE name = '瑜伽')
 ),
-- Q太郎的專長（有氧運動和復健訓練）
(
  (SELECT id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = 'Q太郎')),
 (SELECT id FROM "SKILL" WHERE name = '有氧運動')
 ),
(
  (SELECT id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = 'Q太郎')),
 (SELECT id FROM "SKILL" WHERE name = '復健訓練')
 );

