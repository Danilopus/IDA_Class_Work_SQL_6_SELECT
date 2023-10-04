USE hospital

CREATE TABLE Wards
(
	id INT PRIMARY KEY,
	name VARCHAR(100),
	DepartmentID INT FOREIGN KEY  REFERENCES Departments(id)		
)

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

ALTER TABLE Doctors
ADD DepartmentID INT
GO

CREATE TABLE Departments
(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Building INT NOT NULL,
		CONSTRAINT CHECK_Building_Departments  CHECK (Building > 1 AND Building < 5),
	Financing money NOT NULL DEFAULT 0,
		CONSTRAINT CHECK_Financing_Departments  CHECK (Financing >= 1),
	[Name] NVARCHAR(100)  NOT NULL UNIQUE,
		CONSTRAINT CHECK_Name_Departments  CHECK ([Name] <> '')
);
GO

CREATE TABLE Diseases
(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(100) NOT NULL UNIQUE
		CONSTRAINT CHECK_Name_Diseases  CHECK ([Name] <> ''),
	Severity INT NOT NULL DEFAULT 1
		CONSTRAINT CHECK_Severity_Diseases  CHECK (Severity >= 1),
)
GO

CREATE TABLE Pacients(
	id INTEGER PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(100),
	ward_id INTEGER	FOREIGN KEY REFERENCES Wards(id)
)
GO

CREATE TABLE Donations(
	id INT PRIMARY KEY,
	amount INT,
	[Date] DATE,
	DepartmentID INTEGER FOREIGN KEY REFERENCES Departments(id),	
	SponsorID INTEGER FOREIGN KEY  REFERENCES Sponsors(id)		
)

CREATE TABLE Sponsors(
	id INTEGER PRIMARY KEY,
	name VARCHAR
)

CREATE TABLE Specialization(
	id INTEGER PRIMARY KEY,
	name VARCHAR
)

CREATE TABLE DoctorsSpecializations(
	id INTEGER PRIMARY KEY,
	DoctorId INTEGER FOREIGN KEY  REFERENCES Doctors(id),
	SpecializationId INTEGER FOREIGN KEY  REFERENCES Specialization(id)
)

CREATE TABLE Vacations(
	id INTEGER PRIMARY KEY NOT NULL,
	EndDate DATE NOT NULL,
	StartDate DATE NOT NULL,
	DoctorId INTEGER FOREIGN KEY  REFERENCES Doctors(id)
)
GO

CREATE TABLE ILL_names(
	id INTEGER PRIMARY KEY,
	[name] VARCHAR,
	zaraznoe int
)
GO

CREATE TABLE ILL_history(
	id INTEGER PRIMARY KEY NOT NULL,
	PacientId INTEGER FOREIGN KEY  REFERENCES Pacients(id), 
	DoctoID INTEGER FOREIGN KEY  REFERENCES Doctors(id),
	ILL_name_ID INTEGER FOREIGN KEY  REFERENCES ILL_names(id),
	DateStamp date
)



CREATE TABLE Investigation(
	id INTEGER PRIMARY KEY,
	Pacient_ID INTEGER FOREIGN KEY  REFERENCES Pacients(id), 
	ILL_history_ID INTEGER FOREIGN KEY  REFERENCES ILL_history(id),
	[name] VARCHAR,
	ward_id INTEGER FOREIGN KEY  REFERENCES Wards(id),
	DateStamp date
)

