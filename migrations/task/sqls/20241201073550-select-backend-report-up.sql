-- /* Replace with your SQL commands */

-- -- 查詢：查詢專長為 重訓 的教練，並按經驗年數排序，由資深到資淺（需使用 inner join 與 order by 語法)，顯示須包含以下欄位： 教練名稱 , 經驗年數, 專長名稱
-- SELECT 
--   u.name AS 教練名稱, 
--   c.experience_years AS 經驗年數, 
--   s.name AS 專長名稱
-- FROM 
--   "COACH_LINK_SKILL" cls
-- INNER JOIN 
--   "COACH" c ON cls.coach_id = c.id
-- INNER JOIN 
--   "USER" u ON c.user_id = u.id
-- INNER JOIN 
--   "SKILL" s ON cls.skill_id = s.id
-- WHERE 
--   s.name = '重訓'
-- ORDER BY 
--   c.experience_years DESC;


-- -- 查詢：查詢每種專長的教練數量，並只列出教練數量最多的專長（需使用 group by, inner join 與 order by 與 limit 語法），顯示須包含以下欄位： 專長名稱, coach_total
-- SELECT 
--   s.name AS 專長名稱, 
--   COUNT(cls.coach_id) AS coach_total
-- FROM 
--   "COACH_LINK_SKILL" cls
-- INNER JOIN 
--   "SKILL" s ON cls.skill_id = s.id
-- GROUP BY 
--   s.name
-- ORDER BY 
--   coach_total DESC
-- LIMIT 1;


-- -- 3. 計算 11 月份組合包方案的銷售數量
-- SELECT 
--   cp.name AS 組合包方案名稱, 
--   COUNT(cpr.id) AS 銷售數量
-- FROM 
--   "CREDIT_PURCHASE" cpr
-- INNER JOIN 
--   "CREDIT_PACKAGE" cp ON cpr.credit_package_id = cp.id
-- WHERE 
--   DATE_PART('month', cpr.purchase_at) = 12
-- GROUP BY 
--   cp.name;


-- -- 4. 計算 11 月份總營收
-- SELECT 
--   SUM(cp.price) AS 總營收
-- FROM 
--   "CREDIT_PURCHASE" cpr
-- INNER JOIN 
--   "CREDIT_PACKAGE" cp ON cpr.credit_package_id = cp.id
-- WHERE 
--   DATE_PART('month', cpr.purchase_at) = 12;


-- -- 5. 計算 11 月份有預約課程的會員人數
-- SELECT 
--   COUNT(DISTINCT cb.user_id) AS 預約會員人數
-- FROM 
--   "COURSE_BOOKING" cb
-- WHERE 
--   DATE_PART('month', cb.created_at) = 12
--   AND cb.status IN ('即將授課', '上課中', '已完成');
