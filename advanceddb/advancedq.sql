-- Database: advanced_queries

-- DROP DATABASE IF EXISTS advanced_queries;

CREATE DATABASE advanced_queries
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	
	CREATE TABLE my_contacts (
    contact_id bigserial CONSTRAINT contact_id_key PRIMARY KEY,
    last_name varchar(20) NOT NULL,
    first_name varchar(100) NOT NULL,
    phone integer NOT NULL,
    email varchar(50) NOT NULL constraint email_constraint unique,
    gender varchar(50) NOT NULL, 
    birthday integer NOT NULL,
    prof_id integer NOT NULL references profession (prof_id),
    zip_code integer NOT NULL references zip_code (zip_code),
   status_id integer NOT NULL references status (status_id)
);

CREATE TABLE profession (
    prof_id bigserial CONSTRAINT prof_id_key PRIMARY KEY,
    profession varchar(25) NOT NULL,
constraint u_profession UNIQUE (profession)
);

CREATE TABLE zip_code (
    zip_code integer CONSTRAINT zip_code_key PRIMARY KEY,
    city varchar(25) NOT NULL,
    province varchar(25) NOT NULL,
	CONSTRAINT check_zip_code CHECK (LENGTH(zip_code::varchar(100)) < 5)
);

CREATE TABLE status (
    status_id bigserial CONSTRAINT status_id_key PRIMARY KEY,
    status varchar(25) NOT NULL
);

CREATE TABLE contact_intrest (
    contact_id bigserial references my_contacts (contact_id),
    intrest_id bigserial references intrests (intrest_id)
);

CREATE TABLE contact_seeking (
    contact_id bigserial references my_contacts (contact_id),
    seeking_id bigserial references seeking (seeking_id)
);

CREATE TABLE intrests (
    intrest_id bigserial CONSTRAINT intrest_id_key PRIMARY KEY,
    intrest varchar(25) NOT NULL
);

CREATE TABLE seeking (
    seeking_id bigserial CONSTRAINT seeking_id_key PRIMARY KEY,
    seeking varchar(25) NOT NULL
	);
	
Insert into contact_seeking (contact_id, seeking_id)
VALUES (1, 2),
(2,3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12),
(12, 13),
(13, 14),
(14, 15),
(15, 16),
(16, 17),
(17, 18),
(18, 19);


Insert into contact_intrest (contact_id, intrest_id)
VALUES (1,3),
(2,4),
(3,5),
(4,6),
(5,7),
(6,8),
(7,9),
(8, 10),
(9, 11),
(10, 12),
(11, 13),
(12, 14),
(13,15),
(14, 16),
(15, 17),
(16,18),
(17,19),
(18, 20);

Insert into seeking (seeking_id, seeking)
VALUES (2,'male'),
(3,'female'),
(4,'female'),
(5,'female'),
(6,'male'),
(7, 'female'),
(8, 'female'),
(9, 'male'),
(10, 'male' ),
(11, 'female'),
(12, 'male'),
(13, 'female'),
(14, 'male'),
(15, 'female'),
(16, 'male'),
(17, 'male'),
(18, 'female'),
(19, 'female');


Insert into intrests (intrest_id, intrest)
VALUES (3,'bowling'),
(4,'music'),
(5,'fishing'),
(6,'gaming'),
(7,'dancing'),
(8, 'singing'),
(9, 'drawing'),
(10, 'dancing'),
(11, 'gambling'),
(12, 'swimming'),
(13, 'running'),
(14, 'trains'),
(15, 'singing'),
(16, 'hiking'),
(17, 'running'),
(18, 'dancing'),
(19, 'fencing'),
(20, 'paintball');

select * from status;

Insert into status (status_id, status)
VALUES (4, 'open relationship'),
(5,'single'),
(6,'single'),
(7,'single'),
(8,'taken'),
(9, 'single'),
(10, 'single'),
(11, 'single'),
(12, 'taken'),
(13, 'married'),
(14, 'complicated'),
(15, 'single'),
(16, 'single'),
(17, 'single'),
(18, 'single'),
(19, 'married'),
(20, 'married'),
(21, 'single');

Insert into profession( prof_id, profession)
values (5, 'zoo keeper'),
(6, 'teacher'),
(7, 'waiter'),
(8, 'sales agent'),
(9, 'influancer'),
(10, 'doctor'),
(11, 'athlete'),
(12, 'uber driver'),
(13, 'astronout'),
(14, 'pilot'),
(15, 'bartender'),
(16, 'janitor'),
(17, 'florist'),
(18, 'bookkeeper'),
(19, 'mechanic'),
(20, 'carpenter'),
(21, 'electrician'),
(22, 'nurse');

select * from my_contacts;

Insert into zip_code( zip_code, city, province )
values (0454, 'Centurion', 'Gauteng'),
(0967, 'Pretoria', 'Gauteng'),
(0114, 'Cape Town', 'Western Cape'),
(0986, 'Bellville', 'Western Cape'),
(0213, 'Bloemfontein', 'Freestate'),
(0134, 'Welkom', 'Freestate'),
(0154, 'Kimberly', 'Northern Cape'),
(0766, 'Upington', 'Northen Cape'),
(0245, 'Durbun', 'Kwazulu-Natal'),
(0258, 'Pietermartizburg', 'Kwazulu-Natal'),
(0563, 'East London', 'Eastern Cape'),
(0934, 'Port elezibeth', 'Eastern Cape'),
(0129, 'Bela-Bela', 'Limpopo'),
(0763, 'Polokwane', 'Limpopo'),
(0885, 'Mbombela', 'Mpumalanga'),
(0453, 'Witbank', 'Mpumalanga'),
(0925, 'Klerksdorp', 'North-West'),
(0538, 'Rustenburg', 'North-West');


Insert into my_contacts (first_name , last_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
values ('Bradly', 'Cox', 083746585, 'bcox21@gmail.com', 'm', 1997, 5, 0454, 4),
('Dyllan', 'van den Heever',0855531024, 'dvdh12@gmail.com', 'm', 1999, 6, 0967, 5),
('John', 'Smith',0842514549, 'johns32@gmail.com', 'm',1976, 7, 0114, 6),
('Mark', 'West',0854456095, 'mw3@gmail.com', 'm',1995, 8, 0986, 7),
('Armand', 'Joubert',0842369525, 'aj0842@gmail.com', 'm', 1990, 9, 0213, 8),
('Jerrit', 'Swart',0853258613, 'jerrits097@gmail.com', 'm', 1990, 10, 0134, 9),
('Kayla', 'Henning',0843668188, 'kaylahen@gmail.com', 'f', 2001, 11, 0154, 10),
('Michelle', 'Potgieter',0859421542, 'michp34@gmail.com', 'f',1989, 12, 0766, 11),
('Cole', 'du Tiot',0851765564, 'cdutt@gmail.com', 'm', 1999, 13, 0245, 12),
('Kiara', 'Nel',0847671168, 'kiaranel@gmail.com', 'f', 1998, 14, 0258, 13),
('Skye', 'Ying',0857918676, 'Yingying@gmail.com', 'f', 2002, 15, 0563, 14),
('Pieter', 'Smith',0822492988, 'smithp@gmail.com', 'm', 2003, 16, 0934, 15),
('Ruan', 'Fick', 0823304724, 'ruanick@gmail.com', 'm', 2001, 17, 0129, 16),
('Mikayla', 'Rust', 0857331589, 'mrust@gmail.com', 'f', 1994, 18,0763, 17),
('Aby', 'Bauer', 0832482993,'abyyba@gmail.com', 'f', 1990, 19, 0885, 18),
('Nicole', 'Kohn', 0835768176,'kohnnn@gmail.com', 'f', 1985, 20, 0453, 19),
('William', 'Norris', 0835146831, 'norwilnor@gmail.com', 'm',1998, 21, 0925, 20),
('Scott', 'Lang', 0841811738, 'antman@gmail.com', 'm', 1990, 22, 0538, 21);

Select * from seeking;
SELECT seeking_id, COUNT(seeking_id)
FROM contact_seeking
GROUP BY seeking_id
HAVING COUNT(seeking_id) > 1
ORDER BY seeking_id;
-- no duplicates found


-- 2

DELETE FROM my_contacts
WHERE contact_id IN
(SELECT contact_id
FROM
(SELECT contact_id,
ROW_NUMBER() OVER(PARTITION BY contact_id
ORDER BY contact_id) AS row_num
FROM my_contacts) t
WHERE t.row_num > 1);


-- 3
-- 4
-- (tables set up and populated in Project 3)


-- 5

WITH RECURSIVE cohort AS (
SELECT contact_id, prof_id, concat(first_name, ' ', last_name) AS full_name
FROM my_contacts
WHERE prof_id = 2
UNION
SELECT e.contact_id, e.prof_id, e.first_name
FROM my_contacts e
INNER JOIN cohort s ON s.contact_id = e.prof_id)
SELECT * FROM cohort;


-- 6

SELECT * 
FROM my_contacts
ORDER BY contact_id
FETCH FIRST ROW ONLY;


-- 7

SELECT my_contacts.contact_id, my_contacts.first_name, profession.profession
FROM my_contacts INNER JOIN profession 
ON my_contacts.prof_id = profession.prof_id
WHERE profession.prof_id = 3
ORDER BY my_contacts.contact_id;


-- 8

SELECT
mc.first_name,
s.first_name,
mc.seeking
FROM my_contacts mc INNER JOIN seeking s 
ON mc.contact_id <> s.contact_id
AND mc.prof_id = s.prof_id;



-- 9

SELECT first_name, city
FROM my_contacts mc FULL OUTER JOIN zip_code z
ON z.zip_code = mc.zip_code;


-- 10

SELECT z.zip_code, city
FROM zip_code z FULL OUTER JOIN my_contacts m 
ON z.zip_code = m.zip_code
WHERE m.zip_code IS NULL;


-- 11

SELECT
zip_code.zip_code,
zip_code.city,
zip_code.province,
my_contacts.zip_code
FROM zip_code LEFT JOIN my_contacts 
ON zip_code.zip_code = my_contacts.zip_code;


-- 12

SELECT * FROM profession CROSS JOIN my_contacts;


-- 13

SELECT * FROM my_contacts NATURAL JOIN profession;
-- 14

SELECT first_name FROM my_contacts
UNION ALL
SELECT zip_code FROM zip_code
ORDER BY fullname ASC;


-- 15

SELECT contact_id, first_name
INTO my_contacts_newTable
FROM my_contacts
WHERE gender = 'male';


-- 16

select AVG(status_id)
FROM status
-- 1 = married, 2 = single
-- so there are an even number of married/single people

SELECT random() * 100 + 1 AS RAND_1_100
from generate_series(17,32);


-- 17

SELECT contact_id, status_id
FROM my_contacts
WHERE status_id > (
SELECT AVG(status_id) FROM my_contacts
);


-- 18

SELECT relname, relpages 
FROM pg_class 
ORDER BY relpages ASC limit 1;    --'ASC' to show the smallest table


-- 19

SELECT DISTINCT                -- removed 'ON' - query does not work with it.
contact_id, status_id
FROM my_contacts
WHERE status_id > (
SELECT AVG (status_id) FROM my_contacts);






-- 1 (20)

SELECT first_name, intrest, count(*)
FROM my_contacts LEFT JOIN contact_intrest
ON my_contacts.contact_id = contact_intrest.contact_id
LEFT join intrests
ON intrests.intrest_id = contact_intrest.intrest_id
GROUP BY ROLLUP(first_name, intrest)
ORDER BY first_name


-- 2 (21)

SELECT distinct first_name, count(intrest)
FROM my_contacts LEFT JOIN contact_intrest
ON my_contacts.contact_id = contact_intrest.contact_id
LEFT join intrests
ON intrests.intrest_id = contact_intrest.intrest_id
GROUP BY CUBE(first_name, intrest)
ORDER BY first_name;


-- 3 (22)

CREATE INDEX index_gender ON my_contacts (gender);


-- 4 (23)

SELECT distinct first_name, count(intrest)
FROM my_contacts LEFT JOIN contact_intrest
ON my_contacts.contact_id = contact_intrest.contact_id
LEFT join intrests
ON intrests.intrest_id = contact_intrest.intrest_id
GROUP BY CUBE(first_name, intrest)
HAVING count(intrest) > 3 
ORDER BY first_name;

SELECT my_contacts.contact_id, my_contacts.first_name, profession.profession
FROM my_contacts INNER JOIN profession 
ON my_contacts.prof_id = profession.prof_id
WHERE profession.prof_id = 12
ORDER BY my_contacts.contact_id;

-- 5 (24)

CREATE OR REPLACE FUNCTION record_inserts() 
  RETURNS trigger AS
$$
BEGIN
         INSERT INTO contact_seeking (seeking_id)
         VALUES(new.seeking_id);
 
    RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

----creates a new trigger
create trigger triggers_name
after insert
on my_contacts
for each row
execute procedure record_inserts();

-- 6 (25)

SELECT contact_id + 4
FROM my_contacts a
WHERE NOT EXISTS
(
SELECT NULL
FROM my_contacts b
WHERE a.contact_id = b.contact_id + 1
)
ORDER BY contact_id ;

-- 7 (26)

SELECT first_name, status,
RANK() OVER 
	(
	ORDER BY status_id
	)
FROM my_contacts INNER JOIN status USING (status_id);


-- 8 (27)

SELECT first_name, profession,
DENSE_RANK() OVER 
	(
	ORDER BY prof_id
	)
FROM my_contacts INNER JOIN profession USING (prof_id);

-- 9 (28)

SELECT first_name, birthday,
FIRST_VALUE(birthday) OVER (
	ORDER BY birthday
) AS oldest
FROM my_contacts;


-- 10 (29)

SELECT first_name, birthday,
LAST_VALUE(birthday) OVER (
ORDER BY birthday RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS youngest
FROM my_contacts;


-- 11 (30)

EXPLAIN SELECT * FROM my_contacts;


-- 12 (31)

CREATE ROLE dyllan
LOGIN
PASSWORD 'nallyd';

SELECT dyllan FROM pg_roles;


-- 13 (32)

CREATE ROLE admin_dbpj3;

GRANT admin_dbpj3 TO dyllan;

