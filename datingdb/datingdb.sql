-- Database: dating_database

-- DROP DATABASE IF EXISTS dating_database;

CREATE DATABASE dating_database
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
VALUES (19, 2),
(20,3),
(21, 4),
(22, 5),
(23, 6),
(24, 7),
(25, 8),
(26, 9),
(27, 10),
(28, 11),
(29, 12),
(30, 13),
(31, 14),
(32, 15),
(33, 16),
(34, 17),
(35, 18),
(36, 19);


Insert into contact_intrest (contact_id, intrest_id)
VALUES (19, 3),
(20,4),
(21, 5),
(22, 6),
(23, 7),
(24, 8),
(25, 9),
(26, 10),
(27, 11),
(28, 12),
(29, 13),
(30, 14),
(31, 15),
(32, 16),
(33, 17),
(34, 18),
(35, 19),
(36, 20);

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

SELECT c.last_name, c.first_name, c.phone, c.email, c.gender, c.birthday,
p.profession, z.zip_code, z.city, z.province, s.status
FROM my_contacts AS c LEFT JOIN profession AS p
ON c.prof_id = p.prof_id
LEFT JOIN zip_code AS z
ON c.zip_code = z.zip_code
LEFT JOIN status AS s
ON c.status_id = s.status_id;

SELECT contact_id, i.intrest
FROM contact_intrest AS ct
LEFT JOIN intrests AS i
ON ct.intrest_id = i.intrest_id;

SELECT contact_id, sk.seeking
FROM contact_seeking AS ct LEFT JOIN seeking AS sk
ON ct.seeking_id = sk.seeking_id;

SELECT c.last_name, c.first_name, c.phone, c.email, c.gender, c.birthday,
p.profession, z.zip_code, z.city, z.province, s.status,
i.intrest, sk.seeking
FROM my_contacts AS c LEFT JOIN profession AS p
ON c.prof_id = p.prof_id
LEFT JOIN zip_code AS z
ON c.zip_code = z.zip_code
LEFT JOIN status AS s
ON c.status_id = s.status_id
LEFT JOIN contact_intrest as ct
ON c.contact_id = ct.contact_id
LEFT JOIN intrests AS i
ON ct.intrest_id = i.intrest_id
LEFT JOIN contact_seeking as ctr
ON c.contact_id = ctr.contact_id
LEFT JOIN seeking AS sk
ON ctr.seeking_id = sk.seeking_id;
	
