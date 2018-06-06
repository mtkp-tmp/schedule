CREATE TABLE science (
	id_science SERIAL NOT NULL PRIMARY KEY,
	science_name VARCHAR (50)
);

CREATE TABLE subjects (
	id_subject SERIAL NOT NULL PRIMARY KEY,
	subject_name VARCHAR (100),
	id_science INT,
	FOREIGN KEY (id_science) REFERENCES science (id_science)
);

CREATE TABLE calls_full (
	id_calls_full SERIAL NOT NULL PRIMARY KEY,
	call_time_start TIME NOT NULL,
	call_time_end TIME NOT NULL,
	call_name VARCHAR (10)
);

CREATE TABLE calls_short (
	id_calls_short SERIAL NOT NULL PRIMARY KEY,
	call_time_start TIME NOT NULL,
	call_time_end TIME NOT NULL,
	call_name VARCHAR (10)
);

CREATE TABLE speciality (
	id_speciality SERIAL NOT NULL PRIMARY KEY,
	name_speciality VARCHAR (100) NOT NULL,
	abbreviation VARCHAR (10) NOT NULL,
	information VARCHAR (100)
);

CREATE TABLE groups (
	id_group SERIAL NOT NULL PRIMARY KEY,
	name_group VARCHAR NOT NULL,
	course INT NOT NULL,
	id_speciality INT,
	FOREIGN KEY (id_speciality) REFERENCES speciality (id_speciality)
);

CREATE TYPE sex_type AS ENUM ('М', 'Ж');

CREATE TABLE teachers (
	id_teacher SERIAL NOT NULL PRIMARY KEY,
	fio_teacher VARCHAR NOT NULL,
	sex sex_type
);

CREATE TABLE teacher_subject (
	id_rec SERIAL NOT NULL PRIMARY KEY,
	id_teacher INT NOT NULL,
	id_subject INT NOT NULL,
	FOREIGN KEY (id_teacher) REFERENCES teachers (id_teacher),
	FOREIGN KEY (id_subject) REFERENCES subjects (id_subject)
);

CREATE TYPE cab_type AS ENUM (
	'лекционный',
	'компьютерный',
	'ТСО',
	'Лефортово'
);

CREATE TABLE cabinets (
	id_cab SERIAL NOT NULL PRIMARY KEY,
	name_cab VARCHAR (10) NOT NULL,
	TYPE cab_type
);

CREATE TABLE schedule (
	id_rec SERIAL NOT NULL PRIMARY KEY,
	_day DATE NOT NULL,
	id_calls_full INT NOT NULL,
	id_group INT NOT NULL,
	id_subject INT NOT NULL,
	id_teacher INT,
	id_cab INT,
	FOREIGN KEY (id_calls_full) REFERENCES calls_full (id_calls_full),
	FOREIGN KEY (id_group) REFERENCES groups (id_group),
	FOREIGN KEY (id_teacher) REFERENCES teachers (id_teacher),
	FOREIGN KEY (id_subject) REFERENCES subjects (id_subject),
	FOREIGN KEY (id_cab) REFERENCES cabinets (id_cab)
);

