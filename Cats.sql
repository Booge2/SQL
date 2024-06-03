-- CREATE DATABASE Birds
-- ALTER DATABASE Birds RENAME TO Cats
-- DROP DATABASE IF EXISTS Cats
-- CREATE DATABASE VegetablesAndFruits

-- CREATE TABLE Vegetables_And_Fruits (
-- 	ID serial PRIMARY KEY,
--     Name VARCHAR(255) NOT NULL,
--     Type VARCHAR(10) CHECK(Type IN ('Овоч', 'Фрукт')) NOT NULL,
--     Color VARCHAR(50),
--     Calories INT,
--     Description TEXT)

-- INSERT INTO Vegetables_And_Fruits (Name, Type, Color, Calories, Description) 
-- VALUES 
--     ('Яблуко', 'Фрукт', 'Червоний', 52, 'Солодкий фрукт, який часто вживається у свіжому вигляді або в приготованому стані.'),
--     ('Банан', 'Фрукт', 'Жовтий', 89, 'Фрукт з товстою жовтою шкіркою, мяким солодким мякушом.'),
--     ('Помідор', 'Овоч', 'Червоний', 18, 'Соковитий овоч з гладкою шкіркою та кисло-солодким смаком.'),
--     ('Огірок', 'Овоч', 'Зелений', 15, 'Соковитий овоч з хрусткою зеленою шкіркою, часто використовується у свіжому вигляді або для консервації.');


-- SELECT * FROM Vegetables_And_Fruits

-- SELECT * FROM Vegetables_And_Fruits WHERE Type = 'Овоч'

-- SELECT * FROM Vegetables_And_Fruits WHERE Type = 'Фрукт'

-- SELECT Name FROM Vegetables_And_Fruits

-- SELECT DISTINCT Color FROM Vegetables_And_Fruits

-- SELECT * FROM Vegetables_And_Fruits WHERE Type = 'Фрукт' AND Color = 'Червоний'

-- SELECT * FROM Vegetables_And_Fruits WHERE Type = 'Овоч' AND Color = 'Зелений'
