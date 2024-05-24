-- CREATE DATABASE Academy

-- Створення таблиці Departments
-- CREATE TABLE Departments (
--     Id SERIAL PRIMARY KEY,
--     Financing MONEY NOT NULL DEFAULT 0,
--     Name VARCHAR(100) NOT NULL UNIQUE CHECK (Name <> '')
-- )

-- Додавання записів до таблиці Departments
-- INSERT INTO Departments (Financing, Name) VALUES
-- (10000, 'Кафедра інформатики'),
-- (15000, 'Кафедра математики'),
-- (20000, 'Кафедра фізики')

-- Створення таблиці Faculties
-- CREATE TABLE Faculties (
--     Id SERIAL PRIMARY KEY,
--     Dean VARCHAR(255) NOT NULL CHECK (Dean <> ''),
--     Name VARCHAR(100) NOT NULL UNIQUE CHECK (Name <> '')
-- )

-- Додавання записів до таблиці Faculties
-- INSERT INTO Faculties (Dean, Name) VALUES
-- ('Іван Іванович', 'Факультет компютерних наук'),
-- ('Петро Петрович', 'Факультет прикладної математики'),
-- ('Олена Олександрівна', 'Факультет фізики')

-- Створення таблиці Groups
-- CREATE TABLE Groups (
--     Id SERIAL PRIMARY KEY,
--     Name VARCHAR(10) NOT NULL UNIQUE CHECK (Name <> ''),
--     Rating INT NOT NULL CHECK (Rating >= 0 AND Rating <= 5),
--     Year INT NOT NULL CHECK (Year >= 1 AND Year <= 5)
-- )

-- Додавання записів до таблиці Groups
-- INSERT INTO Groups (Name, Rating, Year) VALUES
-- ('IT-101', 5, 1),
-- ('CS-201', 4, 2),
-- ('MA-301', 3, 3),
-- ('PH-401', 2, 4),
-- ('IT-501', 1, 5)

-- Створення таблиці Teachers
-- CREATE TABLE Teachers (
--     Id SERIAL PRIMARY KEY,
--     EmploymentDate DATE NOT NULL CHECK (EmploymentDate >= '1990-01-01'),
--     IsAssistant BOOLEAN NOT NULL DEFAULT FALSE,
--     IsProfessor BOOLEAN NOT NULL DEFAULT FALSE,
--     Name VARCHAR(256) NOT NULL CHECK (Name <> ''),
--     Position VARCHAR(256) NOT NULL CHECK (Position <> ''),
--     Premium MONEY NOT NULL DEFAULT 0,
--     Salary MONEY NOT NULL,
--     Surname VARCHAR(256) NOT NULL CHECK (Surname <> '')
-- )

-- Додавання записів до таблиці Teachers
-- INSERT INTO Teachers (EmploymentDate, IsAssistant, IsProfessor, Name, Position, Premium, Salary, Surname) VALUES
-- ('2005-09-01', FALSE, TRUE, 'Іван', 'Доцент', 500, 3000, 'Іванов'),
-- ('2010-03-15', TRUE, FALSE, 'Петро', 'Асистент', 300, 2000, 'Петров'),
-- ('2000-06-10', FALSE, TRUE, 'Олена', 'Професор', 1000, 4000, 'Олександрівна'),
-- ('2015-01-20', FALSE, FALSE, 'Микола', 'Викладач', 200, 2500, 'Миколаєнко'),
-- ('2020-11-05', TRUE, FALSE, 'Анна', 'Асистент', 150, 1800, 'Семенова')

-- 1. Вивести таблицю кафедр, але розташувати її поля у зворотному порядку.
-- SELECT Name, Financing, Id
-- FROM Departments

-- 2. Вивести назви груп та їх рейтинги з уточненнями до назв полів відповідно до назви таблиці.
-- SELECT Name AS GroupName, Rating AS GroupRating
-- FROM Groups

-- 3. Вивести для викладачів їх прізвища, відсоток ставки по відношенню до надбавки та відсоток ставки по відношенню до зарплати (сума ставки та надбавки).
-- SELECT 
--     Surname,
--     (Salary / Premium) * 100 AS SalaryToPremiumPercentage,
--     (Salary / (Salary + Premium)) * 100 AS SalaryToTotalPercentage
-- FROM Teachers

-- 4. Вивести таблицю факультетів одним полем у такому форматі: «The dean of faculty [faculty] is [dean].».
-- SELECT 
--     'The dean of faculty ' || Name || ' is ' || Dean || '.' AS FacultyInfo
-- FROM Faculties

-- 5. Вивести прізвища професорів, ставка яких перевищує 1050.
-- SELECT Surname
-- FROM Teachers
-- WHERE IsProfessor = TRUE AND Salary::numeric > 1050

-- 6. Вивести назви кафедр, фонд фінансування яких менший, ніж 11000 або більший за 25000.
-- SELECT Name
-- FROM Departments
-- WHERE Financing::numeric < 11000 OR Financing::numeric > 25000

-- 7. Вивести назви факультетів, окрім факультету «Computer Science».
-- SELECT Name
-- FROM Faculties
-- WHERE Name <> 'Факультет фізики'

-- 8. Вивести прізвища та посади викладачів, які не є професорами.
-- SELECT Surname, Position
-- FROM Teachers
-- WHERE IsProfessor = FALSE

-- 9. Вивести прізвища, посади, ставки та надбавки асистентів, надбавка яких у діапазоні від 160 до 550.
-- SELECT Surname, Position, Salary, Premium
-- FROM Teachers
-- WHERE IsAssistant = TRUE AND Premium::numeric BETWEEN 160 AND 550

-- 10. Вивести прізвища та ставки асистентів.
-- SELECT Surname, Salary
-- FROM Teachers
-- WHERE IsAssistant = TRUE

-- 11. Вивести прізвища та посади викладачів, які були прийняті на роботу до 01.01.2000.
-- SELECT Surname, Position
-- FROM Teachers
-- WHERE EmploymentDate < '2000-01-01'

-- 12. Вивести назви кафедр, які в алфавітному порядку розміщені до кафедри «Software Development». Виведене поле назвіть «Name of Department».
-- SELECT Name AS "Name of Department"
-- FROM Departments
-- WHERE Name < 'Кафедра математики'
-- ORDER BY Name

-- 13. Вивести прізвища асистентів із зарплатою (сума ставки та надбавки) не більше 1200.
-- SELECT Surname
-- FROM Teachers
-- WHERE IsAssistant = TRUE AND (Salary + Premium)::numeric <= 1200

-- 14. Вивести назви груп 5-го курсу з рейтингом у діапазоні від 2 до 4.
-- SELECT Name
-- FROM Groups
-- WHERE Year = 5 AND Rating BETWEEN 2 AND 4

-- 15. Вивести прізвища асистентів зі ставкою менше, ніж 550 або надбавкою менше, ніж 200.
-- SELECT Surname
-- FROM Teachers
-- WHERE IsAssistant = TRUE AND (Salary::numeric < 550 OR Premium::numeric < 200)
