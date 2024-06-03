-- Відображення усіх овочів з калорійністю, менше вказаної.
-- SELECT * 
-- FROM Vegetables_And_Fruits
-- WHERE Type = 'Овоч' AND Calories < 30

-- Відображення усіх фруктів з калорійністю у вказаному
-- діапазоні.
-- SELECT * 
-- FROM Vegetables_And_Fruits
-- WHERE Type = 'Фрукт' AND Calories BETWEEN 10 AND 60

-- Відображення усіх овочів, у назві яких є вказане слово.
-- Наприклад, слово: капуста.
-- SELECT * 
-- FROM Vegetables_And_Fruits
-- WHERE Type = 'Овоч' AND Name LIKE '%Помідор%'

-- Відображення усіх овочів та фруктів, у короткому описі
-- яких є вказане слово. Наприклад, слово: гемоглобін.
-- SELECT * 
-- FROM Vegetables_And_Fruits
-- WHERE Description LIKE '%шкіркою%'

-- Показати усі овочі та фрукти жовтого або червоного
-- кольору.
-- SELECT * 
-- FROM Vegetables_And_Fruits
-- WHERE Color IN ('Жовтий', 'Червоний')

-- Показати кількість овочів.
-- SELECT COUNT(*) AS vegetable_count
-- FROM Vegetables_And_Fruits
-- WHERE Type = 'Овоч'


-- Показати кількість фруктів.
-- SELECT COUNT(*) AS vegetable_count
-- FROM Vegetables_And_Fruits
-- WHERE Type = 'Фрукт'

-- Показати кількість овочів та фруктів заданого кольору.
-- SELECT COUNT(*) AS count_of_given_color
-- FROM Vegetables_And_Fruits
-- WHERE Color = 'Жовтий'

-- Показати кількість овочів та фруктів кожного кольору.
-- SELECT Color, COUNT(*) AS count_per_color
-- FROM Vegetables_And_Fruits
-- GROUP BY Color

-- Показати колір мінімальної кількості овочів та фруктів.
-- SELECT Color
-- FROM Vegetables_And_Fruits
-- GROUP BY Color
-- ORDER BY COUNT(*) ASC
-- LIMIT 1

-- Показати колір максимальної кількості овочів та фруктів.
-- SELECT Color
-- FROM Vegetables_And_Fruits
-- GROUP BY Color
-- ORDER BY COUNT(*) DESC
-- LIMIT 1

-- Показати мінімальну калорійність овочів та фруктів.
-- SELECT MIN(Calories) AS min_calories
-- FROM Vegetables_And_Fruits

-- Показати максимальну калорійність овочів та фруктів.
-- SELECT MAX(Calories) AS min_calories
-- FROM Vegetables_And_Fruits

-- Показати середню калорійність овочів та фруктів.
-- SELECT AVG(Calories) AS avg_calories
-- FROM Vegetables_And_Fruits

-- Показати фрукт з мінімальною калорійністю.
-- SELECT *
-- FROM Vegetables_And_Fruits
-- WHERE Type = 'Фрукт'
-- ORDER BY Calories ASC
-- LIMIT 1

-- Показати фрукт з максимальною калорійністю.
SELECT *
FROM Vegetables_And_Fruits
WHERE Type = 'Фрукт'
ORDER BY Calories DESC
LIMIT 1
