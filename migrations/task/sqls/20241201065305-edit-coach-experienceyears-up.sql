/* Replace with your SQL commands */
-- 更新教練 肌肉棒子 的經驗年數為 3 年
UPDATE "COACH"
SET experience_years = 3
WHERE user_id = (SELECT id FROM "USER" WHERE name = '肌肉棒子');

-- 更新教練 Q太郎 的經驗年數為 5 年
UPDATE "COACH"
SET experience_years = 5
WHERE user_id = (SELECT id FROM "USER" WHERE name = 'Q太郎');
