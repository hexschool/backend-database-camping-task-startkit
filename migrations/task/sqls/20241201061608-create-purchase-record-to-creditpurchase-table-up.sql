/* Replace with your SQL commands */
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


