-- ЗАПРОС 1
SELECT 
doc_spec_id.ФИО,
Specialization.[name]
FROM
	(SELECT 
		Doctors.[NAME] + Surname as ФИО,
		DoctorsSpecializations.SpecializationId	
	FROM 
		Doctors, DoctorsSpecializations
	WHERE 
		Doctors.id = DoctorsSpecializations.DoctorId
	) AS doc_spec_id,
	Specialization
WHERE 
Specialization.id = doc_spec_id.SpecializationId

-- ЗАПРОС 2
SELECT 
		Doctors.[NAME] + Surname as ФИО,
		Doctors.salary
	FROM
		Doctors,
		Vacations
	WHERE
	-- HAVING
		(GETDATE() <= Vacations.StartDate 
		OR
		GETDATE() >= Vacations.EndDate) 
		AND
		Doctors.id = Vacations.DoctorId


-- ЗАПРОС 3
SELECT 
Wards.[name],
Departments.[Name]
FROM
Departments,
Wards
WHERE
wards.DepartmentID = Departments.id
AND
Departments.[Name] = 'Urology'

-- ЗАПРОС 4. Вывести названия отделений без повторений, которые 
-- спонсируются компанией “Umbrella Corporation”
SELECT 
Departments.[Name] as Отделение,
Sponsors.[name] as Спонсор,
Donations.[Date] as Когда,
Donations.[amount] as Сколько
FROM
Departments,
Donations,
Sponsors
WHERE
Donations.SponsorID = Sponsors.id
AND
Donations.DepartmentID = Departments.id
AND
Sponsors.[name] = 'RMK'


-- ЗАПРОС 5. Вывести все пожертвования за последний месяц в виде: 
-- отделение, спонсор, сумма пожертвования, дата пожертвования
SELECT 
Departments.[Name] as Отделение,
Sponsors.[name] as Спонсор,
Donations.[Date] as Когда,
Donations.[amount] as Сколько
FROM
Departments,
Donations,
Sponsors
WHERE
Donations.SponsorID = Sponsors.id
AND
Donations.DepartmentID = Departments.id

-- ЗАПРОС 6. Вывести фамилии врачей с указанием отделений, в которых они проводят обследования. 
-- Необходимо учитывать обследования, проводимые только в будние дни
SELECT
Doctors.[Name] + Doctors.Surname as [ФИО Врача],
Departments.[Name] as Отделение,
Investigation.[name] as Обследование,
Investigation.DateStamp as [Дата Обследоания]
FROM
Doctors,
Investigation,
ILL_history,
Departments
WHERE
DATEPART(dw, Investigation.DateStamp) <> 6
AND
DATEPART(dw, Investigation.DateStamp) <> 7
AND 
Investigation.ILL_history_ID = ILL_history.id
AND
Doctors.id = ILL_history.DoctoID
AND 
Doctors.DepartmentID = Departments.id

-- ЗАПРОС 7. Вывести названия палат и корпуса отделений, в которых 
-- проводит обследования врач “Helen Williams”.
SELECT
* 
FROM
Investigation,
Wards,
Departments,
Doctors,
ILL_history
WHERE
wards.DepartmentID = Departments.id
AND
Doctors.DepartmentID = Departments.id
AND
Investigation.ILL_history_ID = ILL_history.id
AND
Doctors.id = ILL_history.DoctoID
--Group by Investigation.id

--Doctors.Surname = 'Utkin'


