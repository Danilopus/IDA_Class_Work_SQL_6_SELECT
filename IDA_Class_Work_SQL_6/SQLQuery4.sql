SELECT * FROM Wards
WHERE places >3


SELECT [name] + ' ' + surname as ���, salary as �������� FROM Doctors
WHERE Salary > 100000


SELECT * FROM (SELECT [name] + ' ' + surname as ���, salary as �������� FROM Doctors) AS doc_view
WHERE �������� > 120000
-- HAVING doc_view.�������� > 120000

SELECT *
FROM Wards,Departments
WHERE Wards.DepartmentID = Departments.id

SELECT Wards.[name] as ������, 
	Departments.Building as ������,
	Departments.[Name] as ���������, 
	places as [���������� ����]	
FROM Wards,Departments
WHERE Wards.DepartmentID = Departments.id

SELECT * FROM pacients
GO

CREATE VIEW view_name AS
SELECT Wards.[name] as ������, 
	Departments.Building as ������,
	Departments.[Name] as ���������, 
	places as [���������� ����]	
FROM Wards,Departments
WHERE Wards.DepartmentID = Departments.id
GO

SELECT * FROM view_name




