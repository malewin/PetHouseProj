USE FriendsOfHuman;

CREATE TABLE CAT (
	id INT PRIMARY KEY AUTO_INCREMENT,
    date_of_birth DATE,
	klichka CHAR(30),
    commands TEXT,
    `type` ENUM('Pets','PackAnimals'),
    view ENUM('CAT','Dog','HAMSTER','Horse','Donkey','Camel')
);

CREATE TABLE Dog (
	id INT PRIMARY KEY AUTO_INCREMENT,
    date_of_birth DATE,
	klichka CHAR(30),
    commands TEXT,
    `type` ENUM('Pets','PackAnimals'),
    view ENUM('CAT','Dog','HAMSTER','Horse','Donkey','Camel')
);

CREATE TABLE HAMSTER (
	id INT PRIMARY KEY AUTO_INCREMENT,
    date_of_birth DATE,
	klichka CHAR(30),
    commands TEXT,
    `type` ENUM('Pets','PackAnimals'),
    view ENUM('CAT','Dog','HAMSTER','Horse','Donkey','Camel')
);

CREATE TABLE Horse (
	id INT PRIMARY KEY AUTO_INCREMENT,
    date_of_birth DATE,
	klichka CHAR(30),
    commands TEXT,
    `type` ENUM('Pets','PackAnimals'),
    view ENUM('CAT','Dog','HAMSTER','Horse','Donkey','Camel')
);

CREATE TABLE Donkey (
	id INT PRIMARY KEY AUTO_INCREMENT,
    date_of_birth DATE,
	klichka CHAR(30),
    commands TEXT,
    `type` ENUM('Pets','PackAnimals'),
    view ENUM('CAT','Dog','HAMSTER','Horse','Donkey','Camel')
);

CREATE TABLE Camel (
	id INT PRIMARY KEY AUTO_INCREMENT,
    date_of_birth DATE,
	klichka CHAR(30),
    commands TEXT,
    `type` ENUM('Pets','PackAnimals'),
    view ENUM('CAT','Dog','HAMSTER','Horse','Donkey','Camel')
);

INSERT INTO Dog (date_of_birth, klichka, commands, `type`, view) VALUES 
	('2023-02-02','Tuzik', 'appord', 'Pets', 'Dog'),
	('2023-04-05','Barbos', 'voice', 'Pets', 'Dog'),
    ('2021-10-20','businka', 'jump', 'Pets', 'Dog'),

   
INSERT INTO CAT (date_of_birth, klichka, commands, `type`, view) VALUES 
	('2020-11-25','stesha', 'meow', 'Pets', 'CAT'),
	('2022-01-05','musya', 'catch', 'Pets', 'CAT'),
    ('2024-01-05','zhora', 'jump', 'Pets', 'CAT'),

    
INSERT INTO HAMSTER (date_of_birth, klichka, commands, `type`, view) VALUES 
	('2023-07-05','FUPEE', 'runInWheel', 'Pets', 'HAMSTER'),
	('2023-12-15','gliglz', 'voice', 'Pets', 'HAMSTER'),
    ('2024-03-15','snitch', 'jump', 'Pets', 'HAMSTER'),

    
INSERT INTO Horse (date_of_birth, klichka, commands, `type`, view) VALUES 
	('2020-03-15','bucefal', 'galop', 'PackAnimals', 'Horse'),
	('2019-04-05','donkihots_baby', 'dyby', 'PackAnimals', 'Horse'),
    ('2022-03-03','hercules', 'jump', 'PackAnimals', 'Horse'),

INSERT INTO Donkey (date_of_birth, klichka, commands, `type`, view) VALUES 
	('2018-06-06','ishak', 'laugh', 'PackAnimals', 'Donkey'),
	('2022-08-06','oslya', 'tofart', 'PackAnimals', 'Donkey'),
    ('2023-08-08','tupysh', 'bestubborn', 'PackAnimals', 'Donkey'),

INSERT INTO Camel (date_of_birth, klichka, commands, `type`, view) VALUES 
	('2023-08-08','2bugra', 'eat', 'PackAnimals', 'Camel'),
	('2021-10-10','ralf', 'go', 'PackAnimals', 'Camel'),
    ('2022-11-11','desert', 'sleep', 'PackAnimals', 'Camel'),

    
TRUNCATE Camel;

INSERT INTO Horse (date_of_birth, klichka, commands, `type`, view)
SELECT date_of_birth, klichka, commands, `type`, view
FROM Donkey;

DROP TABLE Donkey;

RENAME TABLE Horse TO HorseAndDonkey;

CREATE TABLE young_animals (
	id INT PRIMARY KEY AUTO_INCREMENT,
    date_of_birth DATE,
	klichka CHAR(30),
    commands TEXT,
    `type` ENUM('Pets','PackAnimals'),
    view ENUM('CAT','Dog','HAMSTER','Horse','Donkey','Camel'),
    age TEXT
);


DELIMITER $$
CREATE FUNCTION age_animal (date_of_b DATE)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE res TEXT DEFAULT '';
	SET res = CONCAT(
            TIMESTAMPDIFF(YEAR, date_of_b, CURDATE()),
            ' years ',
            TIMESTAMPDIFF(MONTH, date_of_b, CURDATE()) % 12,
            ' month'
        );
	RETURN res;
END $$
DELIMITER ;

INSERT INTO young_animals (date_of_birth, klichka, commands, `type`, view, age)
SELECT date_of_birth, klichka, commands, `type`, view, age_animal(date_of_birth)
FROM CAT
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 1 AND 3
UNION ALL
SELECT date_of_birth, klichka, commands, `type`, view, age_animal(date_of_birth)
FROM Dog
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 1 AND 3
UNION ALL
SELECT date_of_birth, klichka, commands, `type`, view, age_animal(date_of_birth)
FROM HAMSTER
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 1 AND 3
UNION ALL
SELECT date_of_birth, klichka, commands, `type`, view, age_animal(date_of_birth)
FROM HorseAndDonkey
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 1 AND 3;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM CAT 
WHERE TIMESTAMPDIFF(YEAR, CAT.date_of_birth, CURDATE()) IN (1, 2, 3);

DELETE FROM Dog 
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 1 AND 3;

DELETE FROM HAMSTER
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 1 AND 3;

DELETE FROM HorseAndDonkey
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 1 AND 3;

CREATE TABLE Animals (
	id INT PRIMARY KEY AUTO_INCREMENT,
    date_of_birth DATE,
	klichka VARCHAR(30),
    commands TEXT,
    `type` ENUM('Pets','PackAnimals'),
    view ENUM('CAT','Dog','HAMSTER','Horse','Donkey','Camel'),
    age TEXT,
    animal_table ENUM('CAT','Dog','HAMSTER', 'HorseAndDonkey', 'young_animals') NOT NULL
);

INSERT INTO Animals (date_of_birth, klichka, commands, `type`, view, age, animal_table)
SELECT date_of_birth, klichka, commands, `type`, view, age_animal(date_of_birth), 'CAT'
FROM CAT;

INSERT INTO Animals (date_of_birth, klichka, commands, `type`, view, age, animal_table)
SELECT date_of_birth, klichka, commands, `type`, view, age_animal(date_of_birth), 'Dog'
FROM Dog;

INSERT INTO Animals (date_of_birth, klichka, commands, `type`, view, age, animal_table)
SELECT date_of_birth, klichka, commands, `type`, view,  age_animal(date_of_birth), 'HAMSTER'
FROM HAMSTER;

INSERT INTO Animals (date_of_birth, klichka, commands, `type`, view, age, animal_table)
SELECT date_of_birth, klichka, commands, `type`, view, age_animal(date_of_birth), 'HorseAndDonkey'
FROM HorseAndDonkey;

INSERT INTO Animals (date_of_birth, klichka, commands, `type`, view, age, animal_table)
SELECT date_of_birth, klichka, commands, `type`, view, age_animal(date_of_birth), 'young_animals'
FROM young_animals;