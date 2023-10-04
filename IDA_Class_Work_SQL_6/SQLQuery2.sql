--USE DATABASE hospital

ALTER TABLE Doctors ADD FOREIGN KEY (DepartmentID) REFERENCES Departments(id)

--ALTER TABLE Doctors
--MODIFY COLUMN `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT FIRST

CREATE TABLE Doctors
(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(max) NOT NULL
		CONSTRAINT CHECK_Name_Doctors  CHECK ([Name] <> ''),
	Phone CHAR(10),
	Salary MONEY NOT NULL
		CONSTRAINT CHECK_Salary_Doctors  CHECK (Salary > 0),
	Surname NVARCHAR(max) NOT NULL
		CONSTRAINT CHECK_SurName_Doctors  CHECK (Surname <> '')
)
GO

--Сообщение 3726, уровень 16, состояние 1, строка 22
--Невозможно удалить объект "Departments", так как на него ссылается ограничение FOREIGN KEY.
DROP TABLE Departments
GO
--Сообщение 3726, уровень 16, состояние 1, строка 23
-- Невозможно удалить объект "Doctors", так как на него ссылается ограничение FOREIGN KEY.
DROP TABLE Doctors
GO

DROP TABLE DoctorsSpecializations
CREATE TABLE DoctorsSpecializations(
	id INTEGER IDENTITY (1,1) PRIMARY KEY,
	DoctorId INTEGER FOREIGN KEY  REFERENCES Doctors(id),
	SpecializationId INTEGER FOREIGN KEY  REFERENCES Specialization(id)
)
GO

DROP TABLE Specialization
CREATE TABLE Specialization(
	id INTEGER IDENTITY (1,1) PRIMARY KEY,
	[name] VARCHAR (100)
)

ALTER TABLE Specialization DROP COLUMN id
ALTER TABLE Specialization ADD id INTEGER IDENTITY (1,1) PRIMARY KEY

DROP TABLE Donations
DROP TABLE Sponsors
CREATE TABLE Sponsors(
	id INTEGER IDENTITY (1,1) PRIMARY KEY,
	name VARCHAR(100)
)


CREATE TABLE Donations(
	id INT IDENTITY (1,1) PRIMARY KEY,
	amount INT,
	[Date] DATE,
	DepartmentID INTEGER FOREIGN KEY REFERENCES Departments(id),	
	SponsorID INTEGER FOREIGN KEY  REFERENCES Sponsors(id)		
)

DROP TABLE ILL_history
DROP TABLE ILL_names
CREATE TABLE ILL_names(
	id INTEGER IDENTITY (1,1) PRIMARY KEY,
	[name] VARCHAR(100),
	zaraznoe BIT
)
GO

ALTER TABLE ILL_names DROP COLUMN id
ALTER TABLE ILL_names DROP COLUMN [name]

ALTER TABLE ILL_names ADD [name] VARCHAR(100)

ALTER TABLE ILL_names ADD id INTEGER IDENTITY (1,1) PRIMARY KEY

DROP TABLE Wards

DROP TABLE Pacients