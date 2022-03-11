--Chapter 1

Create Table animal_type (
animal_type_id bigserial, animal_kind varchar(20) 
);

CREATE TABLE animal_info (
gender varchar(6), diet varchar(15)
);

INSERT INTO animal_type (animal_type_id, animal_kind)
VALUES (1, 'African Elephant'),
       (2, 'African Lion');
	   
INSERT INTO animal_info (gender, diet)
VALUES ('f', 'herbivore'),
       ('m', 'Carnivore');
	   
INSERT INTO animal_type (animal_type_id, animal_kind)
VALUES (3 'Baboon');

--Chapter 2

SELECT school, first_name, last_name
FROM teachers
ORDER BY school, last_name;

SELECT first_name, last_name, school, salary
FROM teachers
WHERE first_name LIKE 'S%'
      AND salary > 40000;
	  
SELECT last_name, first_name, school, hire_date, salary
FROM teachers
WHERE hire_date >= '2010-01-01'
ORDER BY salary DESC;

--Chapter 3
	  
numeric(4,1)  --the value can be stored to 999.9

varchar(50) -- seperating helps with organazing and work on each name indepeditly

-- an error would occar

--Chapter 4

COPY actors
FROM 'C:\Users\HP\SQL\analysis\try yourself\movies.txt'
WITH (FORMAT CSV, HEADER, DELIMITER ':');

	  
 COPY (
    SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent
    FROM us_counties_2010 ORDER BY housing_unit_count_100_percent DESC LIMIT 20
     )
TO 'C:\C:\Users\HP\SQL\analysis\us_counties_housing_export.txt'
WITH (FORMAT CSV, HEADER);     


--No, the precision is to small

--Chapter 5

SELECT 3.14 * 5 ^ 2;

--Chapter 6

SELECT c2010.geo_name,
       c2010.state_us_abbreviation,
       c2000.geo_name
FROM us_counties_2010 c2010 LEFT JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips
WHERE c2000.geo_name IS NULL;

SELECT c2010.geo_name,
       c2000.geo_name,
       c2000.state_us_abbreviation
FROM us_counties_2010 c2010 RIGHT JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips
WHERE c2010.geo_name IS NULL;

--2

SELECT median(round( (CAST(c2010.p0010001 AS numeric(8,1)) - c2000.p0010001)
           / c2000.p0010001 * 100, 1 )) AS median_pct_change
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips;
   
   
   
 --Chapter 7
 
 CREATE TABLE albums (
    album_id bigserial,
    album_catalog_code varchar(100),
    album_title text,
    album_artist text,
    album_time interval,
    album_release_date date,
    album_genre varchar(40),
    album_description text
);

CREATE TABLE songs (
    song_id bigserial,
    song_title text,
    song_artist text,
    album_id bigint
);


CREATE TABLE albums (
    album_id bigserial,
    album_catalog_code varchar(100) NOT NULL,
    album_title text NOT NULL,
    album_artist text NOT NULL,
    album_release_date date,
    album_genre varchar(40),
    album_description text,
    CONSTRAINT album_id_key PRIMARY KEY (album_id),
    CONSTRAINT release_date_check CHECK (album_release_date > '1/1/1925')
);

CREATE TABLE songs (
    song_id bigserial,
    song_title text NOT NULL,
    song_artist text NOT NULL,
    album_id bigint REFERENCES albums (album_id),
    CONSTRAINT song_id_key PRIMARY KEY (song_id)
);

--album_catalog_code

--album_id
