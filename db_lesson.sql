CREATE TABLE departments (
    department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE people
ADD COLUMN department_id INT UNSIGNED AFTER email;

INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, email, department_id, age, gender)
VALUES
('鈴木たかし', 'suzuki@gizumo.jp', 1, 20, 1),
('田中ゆうこ', 'tanaka@gizumo.jp', 1, 25, 2),
('福田だいすけ', 'fukuda@gizumo.jp', 1, 42, 1),
('豊島はなこ', 'toyoshima@gizumo.jp', 2, 34, 2),
('不思議沢みちこ', 'fushigisawa@gizumo.jp', 2, 30, 2),
('山田太郎', 'yamada@gizumo.jp', 2, 22, 1),
('佐藤花子', 'sato@gizumo.jp', 2, 28, 2),
('中村一郎', 'nakamura@gizumo.jp', 3, 31, 1),
('小林美咲', 'kobayashi@gizumo.jp', 4, 26, 2),
('伊藤健', 'ito@gizumo.jp', 5, 24, 1);

INSERT INTO reports (person_id, content)
VALUES
(1, '本日は接客を頑張りました。'),
(2, 'SQLの学習を行いました。'),
(3, 'Gitの復習をしました。'),
(4, '課題を進めました。'),
(6, '業務内容を確認しました。'),
(7, '接客スキルの向上に努めました。'),
(8, 'キャンペーン内容を学習しました。'),
(9, '日報を提出しました。'),
(10, 'レビュー内容を確認しました。'),
(11, '情報システムの設定を確認しました。');

UPDATE people SET department_id = 1 WHERE person_id IN (1, 2, 3);

UPDATE people SET department_id = 2 WHERE person_id IN (4, 6, 7, 8);

UPDATE people SET department_id = 3 WHERE person_id = 9;

UPDATE people SET department_id = 4 WHERE person_id = 10;

UPDATE people SET department_id = 5 WHERE person_id = 11;

SELECT name, age
FROM people
WHERE gender = 1
ORDER BY age DESC;

SELECT
  name, email, age
FROM
  people
WHERE
  department_id = 1
ORDER BY
  created_at;

SELECT name
FROM people
WHERE (age BETWEEN 20 AND 29 AND gender = 2)
OR (age BETWEEN 40 AND 49 AND gender = 1);

SELECT *
FROM people
WHERE department_id = 1
ORDER BY age;

SELECT AVG(age) AS average_age
FROM people
WHERE department_id = 2
AND gender = 2;

SELECT
    people.name,
    departments.name,
    reports.content
FROM people
INNER JOIN reports
ON people.person_id = reports.person_id
INNER JOIN departments
ON people.department_id = departments.department_id;

SELECT people.name
FROM people
LEFT JOIN reports
ON people.person_id = reports.person_id
WHERE reports.person_id IS NULL;
