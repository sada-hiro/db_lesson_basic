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

UPDATE people SET department_id = 1 WHERE person_id IN (1, 2, 3);

UPDATE people SET department_id = 2 WHERE person_id IN (4, 6, 7, 8);

UPDATE people SET department_id = 3 WHERE person_id = 9;

UPDATE people SET department_id = 4 WHERE person_id = 10;

UPDATE people SET department_id = 5 WHERE person_id = 11;

SELECT person_id, name, department_id
FROM people;

SELECT
    p.person_id,
    p.name,
    d.name AS department
FROM people AS p
JOIN departments AS d
ON p.department_id = d.department_id;

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

SELECT name
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
