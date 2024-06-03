-- Створення таблиці Curators
-- CREATE TABLE Curators (
--     Id SERIAL PRIMARY KEY,
--     Name VARCHAR(256) NOT NULL CHECK (Name <> ''),
--     Surname VARCHAR(256) NOT NULL CHECK (Surname <> '')
-- )
-- Додавання записів до таблиці Curators
-- INSERT INTO Curators (Name, Surname) VALUES
-- ('Олександр', 'Шевченко'),
-- ('Наталія', 'Ковальчук'),
-- ('Іван', 'Петренко'),
-- ('Марія', 'Іванова'),
-- ('Олена', 'Сидорова')

-- Додавання колонки FacultyId до таблиці Departments
-- ALTER TABLE Departments
-- -- ADD COLUMN FacultyId INT
-- ALTER COLUMN FacultyId SET NOT NULL

-- Приклад оновлення існуючих записів у таблиці Departments
-- UPDATE Departments
-- SET FacultyId = 1
-- WHERE Id = 1;

-- UPDATE Departments
-- SET FacultyId = 2
-- WHERE Id = 2;

-- UPDATE Departments
-- SET FacultyId = 3
-- WHERE Id = 3;

-- Встановлення зовнішнього ключа на колонку FacultyId
-- ALTER TABLE Departments
-- ADD CONSTRAINT fk_faculty
-- FOREIGN KEY (FacultyId) REFERENCES Faculties(Id);

-- 1. Додавання колонки Financing до таблиці Faculties з дозволом на NULL
-- ALTER TABLE Faculties
-- ADD COLUMN Financing DECIMAL(10, 2);

-- 2. Оновлення колонки Financing значеннями за замовчуванням
-- UPDATE Faculties
-- SET Financing = 0.00
-- WHERE Financing IS NULL;

-- 3. Зміна колонки Financing на NOT NULL і додавання обмеження CHECK
-- ALTER TABLE Faculties
-- ALTER COLUMN Financing SET NOT NULL;

-- ALTER TABLE Faculties
-- ADD CONSTRAINT chk_faculty_financing
-- CHECK (Financing >= 0);

-- 4. Оновлення колонки Financing для кожного факультету
-- UPDATE Faculties
-- SET Financing = 10000.00
-- WHERE Id = 1;

-- UPDATE Faculties
-- SET Financing = 15000.00
-- WHERE Id = 2;

-- UPDATE Faculties
-- SET Financing = 20000.00
-- WHERE Id = 3;

-- 1. Додавання колонки DepartmentId до таблиці Groups з дозволом на NULL
-- ALTER TABLE Groups
-- ADD COLUMN DepartmentId INT;

-- 2. Оновлення існуючих записів у таблиці Groups
-- UPDATE Groups
-- SET DepartmentId = 1
-- WHERE Id = 1;

-- UPDATE Groups
-- SET DepartmentId = 2
-- WHERE Id = 2;

-- UPDATE Groups
-- SET DepartmentId = 3
-- WHERE Id = 3;

-- UPDATE Groups
-- SET DepartmentId = 4
-- WHERE Id = 4;

-- UPDATE Groups
-- SET DepartmentId = 5
-- WHERE Id = 5;

-- 3. Зміна колонки DepartmentId на NOT NULL
-- ALTER TABLE Groups
-- ALTER COLUMN DepartmentId SET NOT NULL;

-- 4. Встановлення зовнішнього ключа на колонку DepartmentId
-- ALTER TABLE Groups
-- ADD CONSTRAINT fk_department
-- FOREIGN KEY (DepartmentId) REFERENCES Departments(Id);

-- Створення таблиці GroupsCurators
-- CREATE TABLE GroupsCurators (
--     Id SERIAL PRIMARY KEY,
--     CuratorId INT NOT NULL,
--     GroupId INT NOT NULL,
--     CONSTRAINT fk_curator FOREIGN KEY (CuratorId) REFERENCES Curators(Id),
--     CONSTRAINT fk_group FOREIGN KEY (GroupId) REFERENCES Groups(Id)
-- );

-- Вставка записів у таблицю GroupsCurators
-- INSERT INTO GroupsCurators (CuratorId, GroupId)
-- VALUES
-- (1, 1),
-- (2, 2),
-- (3, 3);

-- Створення таблиці Subjects
-- CREATE TABLE Subjects (
--     Id SERIAL PRIMARY KEY,
--     Name VARCHAR(100) NOT NULL UNIQUE
-- );

-- Вставка записів у таблицю Subjects
-- INSERT INTO Subjects (Name)
-- VALUES
-- ('Mathematics'),
-- ('Physics'),
-- ('Computer Science');

-- Створення таблиці Lectures
-- CREATE TABLE Lectures (
--     Id SERIAL PRIMARY KEY,
--     LectureRoom VARCHAR(256) NOT NULL,
--     SubjectId INT NOT NULL,
--     TeacherId INT NOT NULL,
--     CONSTRAINT fk_subject FOREIGN KEY (SubjectId) REFERENCES Subjects(Id),
--     CONSTRAINT fk_teacher FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
-- );

-- Вставка записів у таблицю Lectures
-- INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId)
-- VALUES
-- ('Room 101', 1, 1),
-- ('Room 102', 2, 2),
-- ('Room 103', 3, 3);

-- Створення таблиці GroupsLectures
-- CREATE TABLE GroupsLectures (
--     Id SERIAL PRIMARY KEY,
--     GroupId INT NOT NULL,
--     LectureId INT NOT NULL,
--     CONSTRAINT fk_group FOREIGN KEY (GroupId) REFERENCES Groups(Id),
--     CONSTRAINT fk_lecture FOREIGN KEY (LectureId) REFERENCES Lectures(Id)
-- );

-- Вставка записів у таблицю GroupsLectures
-- INSERT INTO GroupsLectures (GroupId, LectureId)
-- VALUES
-- (1, 1),
-- (2, 2),
-- (3, 3);

-- 1. Виведення усіх можливих пар рядків викладачів і груп
-- SELECT Teachers.Name AS Teacher_Name, Groups.Name AS Group_Name
-- FROM Teachers, Groups;

-- 2. Виведення назв факультетів, фонд фінансування кафедр яких перевищує фонд фінансування факультету
-- SELECT F1.Name AS Faculty_Name
-- FROM Faculties F1, Faculties F2
-- WHERE F1.Financing > F2.Financing
-- GROUP BY F1.Name;

-- 3. Виведення прізвищ кураторів груп і назв груп, які вони курирують
-- SELECT Curators.Surname AS Curator_Surname, Groups.Name AS Group_Name
-- FROM Curators
-- JOIN Groups ON Curators.Id = Groups.DepartmentId;

-- 4. Виведення імен та прізвищ викладачів, які читають лекції у групі «P107»
-- SELECT Teachers.Name AS Teacher_Name, Teachers.Surname AS Teacher_Surname
-- FROM Teachers
-- JOIN Lectures ON Teachers.Id = Lectures.TeacherId
-- JOIN Groups ON Groups.Id = Lectures.TeacherId
-- WHERE Groups.Name = 'IT-501'; щось не працює

-- 5. Виведення прізвищ викладачів і назв факультетів, на яких вони читають лекції
-- SELECT Teachers.Surname AS Teacher_Surname, Faculties.Name AS Faculty_Name
-- FROM Teachers
-- JOIN Lectures ON Teachers.Id = Lectures.TeacherId
-- JOIN Groups ON Groups.Id = Lectures.SubjectId
-- JOIN Departments ON Departments.Id = Groups.DepartmentId
-- JOIN Faculties ON Faculties.Id = Departments.FacultyId;

-- 6. Виведення назв кафедр і назв груп, які до них належать
-- SELECT Departments.Name AS Department_Name, Groups.Name AS Group_Name
-- FROM Departments
-- JOIN Groups ON Departments.Id = Groups.DepartmentId;

-- 7. Виведення назв предметів, які викладає викладач «Samantha Adams»
-- SELECT Subjects.Name
-- FROM Subjects
-- JOIN Lectures ON Subjects.Id = Lectures.SubjectId
-- JOIN Teachers ON Teachers.Id = Lectures.TeacherId
-- WHERE Teachers.Name = 'Samantha' AND Teachers.Surname = 'Adams';

-- 8. Виведення назв кафедр, на яких викладається дисципліна «Database Theory»
-- SELECT Departments.Name
-- FROM Departments
-- JOIN Groups ON Groups.DepartmentId = Departments.Id
-- JOIN Lectures ON Lectures.SubjectId = Groups.Id
-- JOIN Subjects ON Subjects.Id = Lectures.SubjectId
-- WHERE Subjects.Name = 'Computer Science';

-- 9. Виведення назв груп, що належать до факультету «Computer Science»
-- SELECT Groups.Name
-- FROM Groups
-- JOIN Departments ON Departments.Id = Groups.DepartmentId
-- JOIN Faculties ON Faculties.Id = Departments.FacultyId
-- WHERE Faculties.Name = 'Факультет компютерних наук';

-- 10. Виведення назв груп 5-го курсу та назв факультетів, до яких вони належать
-- SELECT Groups.Name AS Group_Name, Faculties.Name AS Faculty_Name
-- FROM Groups
-- JOIN Departments ON Departments.Id = Groups.DepartmentId
-- JOIN Faculties ON Faculties.Id = Departments.FacultyId
-- WHERE Groups.Year = 5;

-- 11. Виведення повних імен викладачів і лекцій, які вони читають (назви предметів та груп), з відбором за аудиторією «B103»
-- SELECT Teachers.Name || ' ' || Teachers.Surname AS Teacher_Full_Name, Subjects.Name AS Subject_Name, Groups.Name AS Group_Name
-- FROM Teachers
-- JOIN Lectures ON Lectures.TeacherId = Teachers.Id
-- JOIN Subjects ON Subjects.Id = Lectures.SubjectId
-- JOIN Groups ON Groups.Id = Lectures.SubjectId
-- WHERE Lectures.LectureRoom = 'Room 102';
