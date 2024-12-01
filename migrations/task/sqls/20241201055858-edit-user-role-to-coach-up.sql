/* Replace with your SQL commands */
UPDATE "USER"
SET "role" = 'COACH'
WHERE "email" IN ('lee2000@hexschooltest.io', 'muscle@hexschooltest.io', 'starplatinum@hexschooltest.io')
  AND "role" = 'USER';