-- ������ 1
SELECT 
doc_spec_id.���,
Specialization.[name]
FROM
	(SELECT 
		Doctors.[NAME] + Surname as ���,
		DoctorsSpecializations.SpecializationId	
	FROM 
		Doctors, DoctorsSpecializations
	WHERE 
		Doctors.id = DoctorsSpecializations.DoctorId
	) AS doc_spec_id,
	Specialization
WHERE 
Specialization.id = doc_spec_id.SpecializationId

-- ������ 2
SELECT 
		Doctors.[NAME] + Surname as ���,
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


-- ������ 3
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

-- ������ 4. ������� �������� ��������� ��� ����������, ������� 
-- ������������ ��������� �Umbrella Corporation�
SELECT 
Departments.[Name] as ���������,
Sponsors.[name] as �������,
Donations.[Date] as �����,
Donations.[amount] as �������
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


-- ������ 5. ������� ��� ������������� �� ��������� ����� � ����: 
-- ���������, �������, ����� �������������, ���� �������������
SELECT 
Departments.[Name] as ���������,
Sponsors.[name] as �������,
Donations.[Date] as �����,
Donations.[amount] as �������
FROM
Departments,
Donations,
Sponsors
WHERE
Donations.SponsorID = Sponsors.id
AND
Donations.DepartmentID = Departments.id

-- ������ 6. ������� ������� ������ � ��������� ���������, � ������� ��� �������� ������������. 
-- ���������� ��������� ������������, ���������� ������ � ������ ���
SELECT
Doctors.[Name] + Doctors.Surname as [��� �����],
Departments.[Name] as ���������,
Investigation.[name] as ������������,
Investigation.DateStamp as [���� �����������]
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

-- ������ 7. ������� �������� ����� � ������� ���������, � ������� 
-- �������� ������������ ���� �Helen Williams�.
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


