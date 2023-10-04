
// Class Work 04.10.2023 -------------------------------------------	

/*

SELECT * FROM Wards
WHERE places >3


SELECT [name] + ' ' + surname as ФИО, salary as Зарплата FROM Doctors
WHERE Salary > 100000


SELECT * FROM (SELECT [name] + ' ' + surname as ФИО, salary as Зарплата FROM Doctors) AS doc_view
WHERE Зарплата > 120000
-- HAVING doc_view.Зарплата > 120000

SELECT *
FROM Wards,Departments
WHERE Wards.DepartmentID = Departments.id

SELECT Wards.[name] as Палата,
	Departments.Building as Корпус,
	Departments.[Name] as Отделение,
	places as [количество коек]
FROM Wards,Departments
WHERE Wards.DepartmentID = Departments.id

SELECT * FROM pacients
GO

CREATE VIEW view_name AS
SELECT Wards.[name] as Палата,
	Departments.Building as Корпус,
	Departments.[Name] as Отделение,
	places as [количество коек]
FROM Wards,Departments
WHERE Wards.DepartmentID = Departments.id
GO

SELECT * FROM view_name





*/

/*

*/
