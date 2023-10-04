
INSERT Departments VALUES (1, 100000, 'Surgery')
INSERT Departments VALUES (2, 200000, 'Cardiology')
INSERT Departments VALUES (3, 300000, 'Urology'), (4, 400000, 'Pulmonology')

SELECT * FROM Departments
--DELETE FROM Departments
--DBCC CHECKIDENT (Departments,RESEED,0)

GO

INSERT Doctors VALUES ('Andrey', '3433700001', 100000, 'Pleshakov', 1),('Samuil', '3433700001', 150000, 'Pleshakov', 1)
INSERT Doctors VALUES ('Vasiliy', '3433700002', 120000, 'Utkin', 2),('Alexey', '3433700002', 130000, 'Dobrynin', 2)
INSERT Doctors VALUES ('Sergey', '3433700003', 90000, 'Malyavin', 3),('Alexei', '3433700003', 105000, 'Gladkov', 3)
INSERT Doctors VALUES ('Pavel', '3433700004', 140000, 'Malyavin', 4),('Roman', '3433700004', 145000, 'Gruznov', 4)

SELECT * FROM Doctors
--DELETE FROM Doctors
--DBCC CHECKIDENT (Doctors,RESEED,0)
GO

INSERT Specialization ([name]) VALUES ('Surgeon'), ('Cardiologist'), ('Urologist'), ('Pulmonolog')
SELECT * FROM Specialization
GO


INSERT DoctorsSpecializations VALUES (1, 1), (2, 1), (3, 2), (4,2), (5,3),(6,3),(7,4),(8,4)
SELECT * FROM DoctorsSpecializations

INSERT Sponsors VALUES ('UGMK'), ('GAZPROM'), ('RMK')
SELECT * FROM Sponsors


INSERT Donations VALUES (1000, '1.01.2000', 1,1), (5000, '1.02.2000', 2,2), (7000, '1.03.2000', 4,3)
SELECT * FROM Donations


INSERT Donations VALUES (1000, '1.01.2000', 1,1), (5000, '1.02.2000', 2,2), (7000, '1.03.2000', 4,3)
SELECT * FROM Donations

INSERT ILL_names VALUES (1,1,'Angina'), (2,1,'ORVI'),(3,1,'AID'),(4,0,'Cancer'),(5,0,'Astma')
SELECT * FROM ILL_names
--DELETE FROM ILL_names


INSERT Wards VALUES (1, 'Palata11',1), (2, 'Palata12',1),(3,'Palata21',2),(4,'Palata22',2),(5,'Palata31',3),(6,'Palata32',3),(7,'Palata41',4),(8,'Palata42',4)
SELECT * FROM Wards
--DELETE FROM Wards

INSERT Pacients VALUES ('Petr',1),('Andrey',1),('Alexei',2),('Grigoriy',2),('Olga',3),('Svetlana',3)
INSERT Pacients VALUES ('Vasiliy',4),('Ivan',4),('Boris',5),('Grigoriy',5),('Kseniya',7),('Irina',7)
SELECT * FROM Pacients
--DELETE FROM Pacients

