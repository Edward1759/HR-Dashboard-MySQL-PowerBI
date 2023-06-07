CREATE DATABASE project;
use project;
select
*
from
HR;



---Rename id column to emp_id--

%%sql
ALTER TABLE HR
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL

%%sql
DESCRIBE hr
SET SQL_SAFE_UPDATES = 0;

UPDATE hr
SET birthdate = CASE
  WHEN birthdate LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
  WHEN birthdate LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%y'), '%Y-%m-%d')
  ELSE NULL
END;

 SELECT * FROM hr LIMIT 5;
 
 ALTER TABLE hr MODIFY COLUMN birthdate DATE;
 
 DESCRIBE hr;
 
 UPDATE hr
SET hire_date = CASE
  WHEN hire_date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
  WHEN hire_date LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%y'), '%Y-%m-%d')
  ELSE NULL
END;

ALTER TABLE hr MODIFY COLUMN hire_date DATE;

UPDATE hr
SET termdate = date(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != ' ';

SELECT termdate FROM hr LIMIT 10;
 
ALTER TABLE hr MODIFY COLUMN termdate DATE;

UPDATE hr
SET termdate = date(STR_TO_DATE(termdate, '%Y-%M-%D,%H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

update hr
Set termdate=date(str_to_date( TERMDATE= '%y-%m-%d', '%H:%i:%s UTC'))
where termdate is not null and termdate !='';
 


ALTER TABLE hr ADD COLUMN age INT;
UPDATE hr SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());


SELECT 
  MIN(age) AS youngest,
  MAX(age) AS oldest
FROM hr;

SELECT LOCATION,COUNT(*)
FROM HR
WHERE age >=18
GROUP BY LOCATION;

----How does the gender distribution vary across department and job tittles--
SELECT 
    department, gender, COUNT(*) AS count
FROM
    hr
WHERE
    age >= 18
GROUP BY department , gender
ORDER BY DEPARTMENT;
-- WHAT IS THE AGE DISTRIBUT--
SELECT jobtitle, count(*) AS count
FROM hr
where age>= 18
GROUP BY jobtitle
ORDER BY jobtitle DESC;

SELECT
location_state
from hr;

select location_state,location_city, count(*) AS count
FROM
HR
WHERE location_state <=18 
GROUP BY location_state,location_city
ORDER BY COUNT DESC;







