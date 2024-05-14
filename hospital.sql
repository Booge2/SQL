-- CREATE DATABASE hospital

-- CREATE TABLE Departments (
--     Id SERIAL PRIMARY KEY,
--     Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
--     Financing DECIMAL(10, 2) NOT NULL DEFAULT 0 CHECK (Financing >= 0),
--     Name VARCHAR(100) NOT NULL UNIQUE
-- )

-- INSERT INTO Departments (Building, Financing, Name) VALUES
-- (1, 50000.00, 'Department A'),
-- (2, 75000.00, 'Department B'),
-- (3, 60000.00, 'Department C'),
-- (4, 90000.00, 'Department D'),
-- (5, 55000.00, 'Department E')

-- CREATE TABLE Diseases (
--     Id SERIAL PRIMARY KEY,
--     Name VARCHAR(100) NOT NULL UNIQUE,
--     Severity INT NOT NULL DEFAULT 1 CHECK (Severity >= 1)
-- )

-- INSERT INTO Diseases (Name, Severity) VALUES 
-- ('Грип', 3),
-- ('Гепатит', 2),
-- ('Ангіна', 2),
-- ('Діабет', 3),
-- ('Астма', 2)

-- CREATE TABLE Doctors (
--     Id SERIAL PRIMARY KEY,
--     Name VARCHAR(255) NOT NULL,
--     Phone CHAR(10),
--     Salary DECIMAL(10, 2) NOT NULL CHECK (Salary > 0),
--     Surname VARCHAR(255) NOT NULL
-- )

-- INSERT INTO Doctors (Name, Phone, Salary, Surname) VALUES
-- ('Іван', '1234567890', 2000.00, 'Петров'),
-- ('Петро', '0987654321', 2500.00, 'Іванов'),
-- ('Марія', '9876543210', 2300.00, 'Сидоренко'),
-- ('Ольга', '0123456789', 2100.00, 'Ковальчук')

-- CREATE TABLE Examinations (
--     Id SERIAL NOT NULL PRIMARY KEY,
--     DayOfWeek INT NOT NULL CHECK (DayOfWeek BETWEEN 1 AND 7),
--     EndTime TIME NOT NULL,
-- 	CONSTRAINT EndTime_GreaterThan_StartTime CHECK (EndTime > StartTime),
--     Name VARCHAR(100) NOT NULL UNIQUE,
--     StartTime TIME NOT NULL CHECK (StartTime >= '08:00' AND StartTime <= '18:00')
-- )

-- INSERT INTO Examinations (DayOfWeek, EndTime, Name, StartTime) VALUES
-- (1, '12:00', 'Загальне обстеження', '08:00'),
-- (2, '14:00', 'УЗД', '10:00'),
-- (3, '16:00', 'ЕКГ', '12:00'),
-- (4, '18:00', 'Рентген', '14:00')

-- CREATE TABLE Wards (
--     Id SERIAL NOT NULL PRIMARY KEY,
--     Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
--     Floor INT NOT NULL CHECK (Floor >= 1),
--     Name VARCHAR(20) NOT NULL UNIQUE
-- )

INSERT INTO Wards (Building, Floor, Name) VALUES 
(1, 1, '101'),
(1, 1, '102'),
(1, 2, '201'),
(2, 1, '301'),
(2, 1, '302')