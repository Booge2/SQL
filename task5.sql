-- -- Додавання нової колонки
-- ALTER TABLE Doctors
-- ADD COLUMN Premium DECIMAL(10, 2) NOT NULL DEFAULT 0;


-- UPDATE Doctors
-- SET Premium = 300
-- WHERE Id = 1;

-- UPDATE Doctors
-- SET Premium = 500
-- WHERE Id = 2;

-- UPDATE Doctors
-- SET Premium = 200
-- WHERE Id = 3;

-- UPDATE Doctors
-- SET Premium = 400
-- WHERE Id = 4;

-- -- Створення таблиці Specializations
-- CREATE TABLE Specializations (
--     Id SERIAL PRIMARY KEY,
--     Name VARCHAR(100) NOT NULL UNIQUE
-- );

-- INSERT INTO Specializations (Name) VALUES ('Cardiology'),
-- ('Neurology'),
-- ('Oncology'),
-- ('Pediatrics'),
-- ('Surgery');


-- Створення таблиці DoctorsSpecializations
-- CREATE TABLE DoctorsSpecializations (
--     Id SERIAL PRIMARY KEY,
--     DoctorId INT NOT NULL,
--     SpecializationId INT NOT NULL,
--     FOREIGN KEY (DoctorId) REFERENCES Doctors(Id),
--     FOREIGN KEY (SpecializationId) REFERENCES Specializations(Id)
-- );

-- INSERT INTO DoctorsSpecializations (DoctorId, SpecializationId) VALUES (1, 1),
-- (1, 2),
-- (2, 3),
-- (3, 4);

-- Створення таблиці Sponsors
-- CREATE TABLE Sponsors (
--     Id SERIAL PRIMARY KEY,
--     Name VARCHAR(100) NOT NULL UNIQUE
-- );

-- INSERT INTO Sponsors (Name) VALUES ('Health Foundation'),
-- ('Wellness Corp'),
-- ('Medical Aid Trust'),
-- ('Global Health Initiative'),
-- ('Healthy Living Fund');

-- CREATE TABLE Donations (
--     Id SERIAL PRIMARY KEY,
--     Amount DECIMAL(10, 2) NOT NULL CHECK (Amount > 0),
--     Date DATE NOT NULL DEFAULT CURRENT_DATE CHECK (Date <= CURRENT_DATE),
--     DepartmentId INT NOT NULL,
--     SponsorId INT NOT NULL,
--     CONSTRAINT fk_department FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
--     CONSTRAINT fk_sponsor FOREIGN KEY (SponsorId) REFERENCES Sponsors(Id)
-- );

-- INSERT INTO Donations (Amount, Date, DepartmentId, SponsorId) VALUES
-- (5000.00, '2023-05-01', 1, 1),
-- (15000.00, '2023-04-15', 2, 2),
-- (25000.00, '2023-03-10', 3, 3),
-- (35000.00, '2023-06-05', 1, 4),
-- (45000.00, '2023-07-20', 2, 5);

-- Створення таблиці відпусток
-- CREATE TABLE Vacations (
--     Id SERIAL PRIMARY KEY,
--     StartDate DATE NOT NULL,
--     EndDate DATE NOT NULL CHECK (EndDate > StartDate),
--     DoctorId INT NOT NULL,
--     FOREIGN KEY (DoctorId) REFERENCES Doctors(Id)
-- );

-- INSERT INTO Vacations (StartDate, EndDate, DoctorId)
-- VALUES 
-- ('2024-06-01', '2024-06-10', 1),
-- ('2024-07-15', '2024-07-25', 2),
-- ('2024-08-01', '2024-08-14', 3),
-- ('2024-09-10', '2024-09-20', 1),
-- ('2024-10-05', '2024-10-15', 2);

-- ALTER TABLE Wards
-- ADD COLUMN DepartmentId INT;

-- UPDATE Wards SET DepartmentId = 1 WHERE Id = 1;
-- UPDATE Wards SET DepartmentId = 2 WHERE Id = 2;
-- UPDATE Wards SET DepartmentId = 3 WHERE Id = 3;
-- UPDATE Wards SET DepartmentId = 4 WHERE Id = 4;
-- UPDATE Wards SET DepartmentId = 1 WHERE Id = 5;

-- ALTER TABLE Wards
-- ALTER COLUMN DepartmentId SET NOT NULL;

-- ALTER TABLE Wards
-- ADD CONSTRAINT fk_department
-- FOREIGN KEY (DepartmentId) REFERENCES Departments(Id);

-- Виведіть повні імена лікарів та їх спеціалізації.
-- SELECT d.Name || ' ' || d.Surname AS Full_Name, s.Name AS Specialization
-- FROM Doctors d
-- JOIN DoctorsSpecializations ds ON d.Id = ds.DoctorId
-- JOIN Specializations s ON ds.SpecializationId = s.Id;

-- 2. Виведіть прізвища та зарплати (сума ставки та надбавки) лікарів, які не перебувають у відпустці.
-- SELECT d.Surname, d.Salary + d.Premium AS Total_Salary
-- FROM Doctors d
-- LEFT JOIN Vacations v ON d.Id = v.DoctorId AND CURRENT_DATE BETWEEN v.StartDate AND v.EndDate
-- WHERE v.DoctorId IS NULL;

-- 3. Виведіть назви палат, які знаходяться у відділенні
-- «Intensive Treatment».
-- SELECT w.Name AS Ward_Name
-- FROM Wards w
-- JOIN Departments d ON w.DepartmentId = d.Id
-- WHERE d.Name = 'Intensive Treatment';

-- 4. Виведіть назви відділень без повторень, які спонсоруються компанією «Umbrella Corporation».
-- SELECT DISTINCT d.Name AS Department_Name
-- FROM Departments d
-- JOIN Donations dn ON d.Id = dn.DepartmentId
-- JOIN Sponsors s ON dn.SponsorId = s.Id
-- WHERE s.Name = 'Umbrella Corporation';

-- 5. Виведіть усі пожертвування за останній місяць у вигляді: відділення, спонсор, сума пожертвування, дата
-- пожертвування.
-- SELECT d.Name AS Department_Name, s.Name AS Sponsor_Name, dn.Amount AS Donation_Amount, dn.Date
-- FROM Donations dn
-- JOIN Departments d ON dn.DepartmentId = d.Id
-- JOIN Sponsors s ON dn.SponsorId = s.Id
-- WHERE dn.Date >= (NOW() - INTERVAL '1 MONTH'); чомусь цей код нічого не виводить.... і нейронка не помагає


-- 6. Виведіть прізвища лікарів із зазначенням відділень,
-- в яких вони проводять обстеження. Враховуйте обстеження, які проводяться лише у будні дні.



-- 7. Виведіть назви відділень, які отримували пожертву-вання
-- у розмірі понад 100000, із зазначенням їх лікарів.
-- SELECT dep.Name AS Department_Name, d.Name || ' ' || d.Surname AS Doctor_Name
-- FROM Departments dep
-- JOIN Donations dn ON dep.Id = dn.DepartmentId
-- JOIN Doctors d ON dep.Id = dn.SponsorId
-- WHERE dn.Amount > 40000; теж не пойму чому не виводить і що я наплутав....

-- 8. Виведіть назви відділень, в яких лікарі не отримують
-- надбавки.
-- SELECT dep.Name AS Department_Name
-- FROM Departments dep
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM Doctors d
--     WHERE d.Id = dep.Id
--     AND d.Premium = 0
-- );

-- 9. Виведіть назви відділень і назви захворювань, обстеження з яких вони проводили за останні півроку.
-- ALTER TABLE Examinations 
-- ADD COLUMN Date DATE NOT NULL DEFAULT CURRENT_DATE;

-- UPDATE Examinations SET Date = '2023-11-01' WHERE Name = 'Загальне обстеження';
-- UPDATE Examinations SET Date = '2023-12-01' WHERE Name = 'УЗД';
-- UPDATE Examinations SET Date = '2024-01-01' WHERE Name = 'ЕКГ';
-- UPDATE Examinations SET Date = '2024-02-01' WHERE Name = 'Рентген';




