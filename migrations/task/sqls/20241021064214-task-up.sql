
-- ████████  █████   █     █ 
--   █ █   ██    █  █     ██ 
--   █ █████ ███ ███       █ 
--   █ █   █    ██  █      █ 
--   █ █   █████ █   █     █ 
-- ===================== ====================
-- 1. 用戶資料，資料表為 USER

-- 1. 新增：新增六筆用戶資料，資料如下：
--     1. 用戶名稱為`李燕容`，Email 為`lee2000@hexschooltest.io`，Role為`USER`
--     2. 用戶名稱為`王小明`，Email 為`wXlTq@hexschooltest.io`，Role為`USER`
--     3. 用戶名稱為`肌肉棒子`，Email 為`muscle@hexschooltest.io`，Role為`USER`
--     4. 用戶名稱為`好野人`，Email 為`richman@hexschooltest.io`，Role為`USER`
--     5. 用戶名稱為`Q太郎`，Email 為`starplatinum@hexschooltest.io`，Role為`USER`
--     6. 用戶名稱為 透明人，Email 為 opacity0@hexschooltest.io，Role 為 USER
INSERT INTO "USER" (name, email, role)
VALUES
    ('李燕容', 'lee2000@hexschooltest.io', 'USER'),
    ('王小明', 'wXlTq@hexschooltest.io', 'USER'),
    ('肌肉棒子', 'muscle@hexschooltest.io', 'USER'),
    ('好野人', 'richman@hexschooltest.io', 'USER'),
    ('Q太郎', 'starplatinum@hexschooltest.io', 'USER'),
    ('透明人', 'opacity0@hexschooltest.io', 'USER')
ON CONFLICT (email) DO NOTHING;

-- 1-2 修改：用 Email 找到 李燕容、肌肉棒子、Q太郎，如果他的 Role 為 USER 將他的 Role 改為 COACH
UPDATE "USER"
SET "role" = 'COACH'
WHERE "email" IN ('lee2000@hexschooltest.io', 'muscle@hexschooltest.io', 'starplatinum@hexschooltest.io')
  AND "role" = 'USER';

-- 1-3 刪除：刪除USER 資料表中，用 Email 找到透明人，並刪除該筆資料
DELETE FROM "USER"
WHERE "email" = 'opacity0@hexschooltest.io';

-- 1-4 查詢：取得USER 資料表目前所有用戶數量（提示：使用count函式）
SELECT COUNT(*) AS "UserCount"
FROM "USER";

-- 1-5 查詢：取得 USER 資料表所有用戶資料，並列出前 3 筆（提示：使用limit語法）
SELECT *
FROM "USER"
ORDER BY "id" ASC
LIMIT 3;


--  ████████  █████   █    ████  
--    █ █   ██    █  █         █ 
--    █ █████ ███ ███       ███  
--    █ █   █    ██  █     █     
--    █ █   █████ █   █    █████ 
-- ===================== ====================
-- 2. 組合包方案 CREDIT_PACKAGE、客戶購買課程堂數 CREDIT_PURCHASE
-- 2-1. 新增：在`CREDIT_PACKAGE` 資料表新增三筆資料，資料需求如下：
    -- 1. 名稱為 `7 堂組合包方案`，價格為`1,400` 元，堂數為`7`
    -- 2. 名稱為`14 堂組合包方案`，價格為`2,520` 元，堂數為`14`
    -- 3. 名稱為 `21 堂組合包方案`，價格為`4,800` 元，堂數為`21`
INSERT INTO "CREDIT_PACKAGE" (name, price, credit_amount)
VALUES
('7 堂組合包方案', 1400, 7),
('14 堂組合包方案', 2520, 14),
('21 堂組合包方案', 4800, 21);

-- 2-2. 新增：在 `CREDIT_PURCHASE` 資料表，新增三筆資料：（請使用 name 欄位做子查詢）
    -- 1. `王小明` 購買 `14 堂組合包方案`
    -- 2. `王小明` 購買 `21 堂組合包方案`
    -- 3. `好野人` 購買 `14 堂組合包方案`
INSERT INTO "CREDIT_PURCHASE" (user_id, credit_package_id, purchased_credits, price_paid)
VALUES
(
  (SELECT id FROM "USER" WHERE name = '王小明' LIMIT 1),
  (SELECT id FROM "CREDIT_PACKAGE" WHERE name = '14 堂組合包方案' LIMIT 1),
  (SELECT credit_amount FROM "CREDIT_PACKAGE" WHERE name = '14 堂組合包方案' LIMIT 1),
  (SELECT price FROM "CREDIT_PACKAGE" WHERE name = '14 堂組合包方案' LIMIT 1)
),
(
  (SELECT id FROM "USER" WHERE name = '王小明' LIMIT 1),
  (SELECT id FROM "CREDIT_PACKAGE" WHERE name = '21 堂組合包方案' LIMIT 1),
  (SELECT credit_amount FROM "CREDIT_PACKAGE" WHERE name = '21 堂組合包方案' LIMIT 1),
  (SELECT price FROM "CREDIT_PACKAGE" WHERE name = '21 堂組合包方案' LIMIT 1)
),
(
  (SELECT id FROM "USER" WHERE name = '好野人' LIMIT 1),
  (SELECT id FROM "CREDIT_PACKAGE" WHERE name = '14 堂組合包方案' LIMIT 1),
  (SELECT credit_amount FROM "CREDIT_PACKAGE" WHERE name = '14 堂組合包方案' LIMIT 1),
  (SELECT price FROM "CREDIT_PACKAGE" WHERE name = '14 堂組合包方案' LIMIT 1)
);





-- ████████  █████   █    ████   
--   █ █   ██    █  █         ██ 
--   █ █████ ███ ███       ███   
--   █ █   █    ██  █         ██ 
--   █ █   █████ █   █    ████   
-- ===================== ====================
-- 3. 教練資料 ，資料表為 COACH ,SKILL,COACH_LINK_SKILL
-- 3-1 新增：在`COACH`資料表新增三筆教練資料，資料需求如下：
    -- 1. 將用戶`李燕容`新增為教練，並且年資設定為2年（提示：使用`李燕容`的email ，取得 `李燕容` 的 `id` ）
    -- 2. 將用戶`肌肉棒子`新增為教練，並且年資設定為2年
    -- 3. 將用戶`Q太郎`新增為教練，並且年資設定為2年
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

-- 3-2. 新增：承1，為三名教練新增專長資料至 `COACH_LINK_SKILL` ，資料需求如下：
    -- 1. 所有教練都有 `重訓` 專長
    -- 2. 教練`肌肉棒子` 需要有 `瑜珈` 專長
    -- 3. 教練`Q太郎` 需要有 `有氧運動` 與 `復健訓練` 專長
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
 )
ON CONFLICT DO NOTHING;

-- 3-3 修改：更新教練的經驗年數，資料需求如下：
    -- 1. 教練`肌肉棒子` 的經驗年數為3年
    -- 2. 教練`Q太郎` 的經驗年數為5年
UPDATE "COACH"
SET experience_years = 3
WHERE user_id = (SELECT id FROM "USER" WHERE name = '肌肉棒子');

UPDATE "COACH"
SET experience_years = 5
WHERE user_id = (SELECT id FROM "USER" WHERE name = 'Q太郎');

-- 3-4 刪除：新增一個專長 空中瑜伽 至 SKILL 資料表，之後刪除此專長。
INSERT INTO "SKILL" (name)
VALUES ('空中瑜伽');

DELETE FROM "SKILL"
WHERE name = '空中瑜伽';

--  ████████  █████   █    █   █ 
--    █ █   ██    █  █     █   █ 
--    █ █████ ███ ███      █████ 
--    █ █   █    ██  █         █ 
--    █ █   █████ █   █        █ 
-- ===================== ==================== 
-- 4. 課程管理 COURSE 、組合包方案 CREDIT_PACKAGE

-- 4-1. 新增：在`COURSE` 新增一門課程，資料需求如下：
    -- 1. 教練設定為用戶`李燕容` 
    -- 2. 在課程專長 `skill_id` 上設定為「 `重訓` 」
    -- 3. 在課程名稱上，設定為「`重訓基礎課`」
    -- 4. 授課開始時間`start_at`設定為2024-11-25 14:00:00
    -- 5. 授課結束時間`end_at`設定為2024-11-25 16:00:00
    -- 6. 最大授課人數`max_participants` 設定為10
    -- 7. 授課連結設定`meeting_url`為 https://test-meeting.test.io
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



-- ████████  █████   █    █████ 
--   █ █   ██    █  █     █     
--   █ █████ ███ ███      ████  
--   █ █   █    ██  █         █ 
--   █ █   █████ █   █    ████  
-- ===================== ====================

-- 5. 客戶預約與授課 COURSE_BOOKING
-- 5-1. 新增：請在 `COURSE_BOOKING` 新增兩筆資料：
    -- 1. 第一筆：`王小明`預約 `李燕容` 的課程
        -- 1. 預約人設為`王小明`
        -- 2. 預約時間`booking_at` 設為2024-11-24 16:00:00
        -- 3. 狀態`status` 設定為即將授課
    -- 2. 新增： `好野人` 預約 `李燕容` 的課程
        -- 1. 預約人設為 `好野人`
        -- 2. 預約時間`booking_at` 設為2024-11-24 16:00:00
        -- 3. 狀態`status` 設定為即將授課
INSERT INTO "COURSE_BOOKING" (course_id, user_id, booking_at, status)
VALUES
(
  -- 第一筆：王小明預約課程
  (SELECT id FROM "COURSE" WHERE user_id = (SELECT user_id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = '李燕容')) AND start_at = '2024-11-25 14:00:00' LIMIT 1),
  (SELECT id FROM "USER" WHERE name = '王小明'),
  '2024-11-24 16:00:00',
  '即將授課'
),
(
  -- 第二筆：好野人預約課程
  (SELECT id FROM "COURSE" WHERE user_id = (SELECT user_id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = '李燕容')) AND start_at = '2024-11-25 14:00:00' LIMIT 1),
  (SELECT id FROM "USER" WHERE name = '好野人'),
  '2024-11-24 16:00:00',
  '即將授課'
);


-- 5-2. 修改：`王小明`取消預約 `李燕容` 的課程，請在`COURSE_BOOKING`更新該筆預約資料：
    -- 1. 取消預約時間`cancelled_at` 設為2024-11-24 17:00:00
    -- 2. 狀態`status` 設定為課程已取消
UPDATE "COURSE_BOOKING"
SET 
  cancelled_at = '2024-11-24 17:00:00',
  status = '課程已取消'
WHERE 
  user_id = (SELECT id FROM "USER" WHERE name = '王小明')
  AND course_id = (SELECT id FROM "COURSE" WHERE user_id = (SELECT user_id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = '李燕容')));

-- 5-3. 新增：`王小明`再次預約 `李燕容`   的課程，請在`COURSE_BOOKING`新增一筆資料：
    -- 1. 預約人設為`王小明`
    -- 2. 預約時間`booking_at` 設為2024-11-24 17:10:25
    -- 3. 狀態`status` 設定為即將授課
INSERT INTO "COURSE_BOOKING" (user_id, course_id, booking_at, status)
VALUES (
  (SELECT id FROM "USER" WHERE name = '王小明'),
  (SELECT id FROM "COURSE" WHERE user_id = (SELECT user_id FROM "COACH" WHERE user_id = (SELECT id FROM "USER" WHERE name = '李燕容')) LIMIT 1),
  '2024-11-24 17:10:25',
  '即將授課'
);

-- 5-4. 查詢：取得王小明所有的預約紀錄，包含取消預約的紀錄
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

-- 5-5. 修改：`王小明` 現在已經加入直播室了，請在`COURSE_BOOKING`更新該筆預約資料（請注意，不要更新到已經取消的紀錄）：
    -- 1. 請在該筆預約記錄他的加入直播室時間 `join_at` 設為2024-11-25 14:01:59
    -- 2. 狀態`status` 設定為上課中
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

-- 5-6. 查詢：計算用戶王小明的購買堂數，顯示須包含以下欄位： user_id , total。 (需使用到 SUM 函式與 Group By)
SELECT 
  u.id AS user_id,
  SUM(cp.purchased_credits) AS total
FROM 
  "CREDIT_PURCHASE" cp
JOIN 
  "USER" u ON cp.user_id = u.id
WHERE 
  u.name = '王小明'
GROUP BY 
  u.id;

-- 5-7. 查詢：計算用戶王小明的已使用堂數，顯示須包含以下欄位： user_id , total。 (需使用到 Count 函式與 Group By)
SELECT 
  u.id AS user_id,
  COUNT(cb.id) AS total
FROM 
  "COURSE_BOOKING" cb
JOIN 
  "USER" u ON cb.user_id = u.id
WHERE 
  u.name = '王小明' 
  AND cb.status IN ('上課中', '已完成') -- 條件：僅計算已使用的堂數
GROUP BY 
  u.id;

-- 5-8. [挑戰題] 查詢：請在一次查詢中，計算用戶王小明的剩餘可用堂數，顯示須包含以下欄位： user_id , remaining_credit
    -- 提示：
    -- select ("CREDIT_PURCHASE".total_credit - "COURSE_BOOKING".used_credit) as remaining_credit, ...
    -- from ( 用戶王小明的購買堂數 ) as "CREDIT_PURCHASE"
    -- inner join ( 用戶王小明的已使用堂數) as "COURSE_BOOKING"
    -- on "COURSE_BOOKING".user_id = "CREDIT_PURCHASE".user_id;
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


-- ████████  █████   █     ███  
--   █ █   ██    █  █     █     
--   █ █████ ███ ███      ████  
--   █ █   █    ██  █     █   █ 
--   █ █   █████ █   █     ███  
-- ===================== ====================
-- 6. 後台報表
-- 6-1 查詢：查詢專長為重訓的教練，並按經驗年數排序，由資深到資淺（需使用 inner join 與 order by 語法)
-- 顯示須包含以下欄位： 教練名稱 , 經驗年數, 專長名稱
SELECT 
  u.name AS 教練名稱, 
  c.experience_years AS 經驗年數, 
  s.name AS 專長名稱
FROM 
  "COACH_LINK_SKILL" cls
INNER JOIN 
  "COACH" c ON cls.coach_id = c.id
INNER JOIN 
  "USER" u ON c.user_id = u.id
INNER JOIN 
  "SKILL" s ON cls.skill_id = s.id
WHERE 
  s.name = '重訓'
ORDER BY 
  c.experience_years DESC;

-- 6-2 查詢：查詢每種專長的教練數量，並只列出教練數量最多的專長（需使用 group by, inner join 與 order by 與 limit 語法）
-- 顯示須包含以下欄位： 專長名稱, coach_total
SELECT 
  s.name AS 專長名稱, 
  COUNT(cls.coach_id) AS coach_total
FROM 
  "COACH_LINK_SKILL" cls
INNER JOIN 
  "SKILL" s ON cls.skill_id = s.id
GROUP BY 
  s.name
ORDER BY 
  coach_total DESC
LIMIT 1;

-- 6-3. 查詢：計算 11 月份組合包方案的銷售數量
-- 顯示須包含以下欄位： 組合包方案名稱, 銷售數量
SELECT 
  cp.name AS 組合包方案名稱, 
  COUNT(cpr.id) AS 銷售數量
FROM 
  "CREDIT_PURCHASE" cpr
INNER JOIN 
  "CREDIT_PACKAGE" cp ON cpr.credit_package_id = cp.id
WHERE 
  DATE_PART('month', cpr.purchase_at) = 12
GROUP BY 
  cp.name;

-- 6-4. 查詢：計算 11 月份總營收（使用 purchase_at 欄位統計）
-- 顯示須包含以下欄位： 總營收
SELECT 
  SUM(cp.price) AS 總營收
FROM 
  "CREDIT_PURCHASE" cpr
INNER JOIN 
  "CREDIT_PACKAGE" cp ON cpr.credit_package_id = cp.id
WHERE 
  DATE_PART('month', cpr.purchase_at) = 12;

-- 6-5. 查詢：計算 11 月份有預約課程的會員人數（需使用 Distinct，並用 created_at 和 status 欄位統計）
-- 顯示須包含以下欄位： 預約會員人數
SELECT 
  COUNT(DISTINCT cb.user_id) AS 預約會員人數
FROM 
  "COURSE_BOOKING" cb
WHERE 
  DATE_PART('month', cb.created_at) = 12
  AND cb.status IN ('即將授課', '上課中', '已完成');