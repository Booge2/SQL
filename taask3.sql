-- Показати ПІБ усіх студентів з мінімальною оцінкою
-- у вказаному діапазоні.
-- SELECT full_name
-- FROM students_grades
-- WHERE average_score = (
--     SELECT MIN(average_score)
--     FROM students_grades
--     WHERE average_score >= 4 AND average_score <= 4.7
-- )

-- Показати інформацію про студентів, яким виповнилося 20 років.
-- SELECT *
-- FROM STUDENTS_GRADES
-- WHERE BIRTHDAY + INTERVAL '20 years' <= CURRENT_DATE

-- Показати інформацію про студентів з віком, у вказаному діапазоні.
-- SELECT *
-- FROM STUDENTS_GRADES
-- WHERE EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM BIRTHDAY) BETWEEN 18 AND 25

-- Показати інформацію про студентів із конкретним
-- ім’ям. Наприклад, показати студентів з ім’ям Борис.
-- SELECT *
-- FROM STUDENTS_GRADES
-- WHERE FULL_NAME LIKE '%Іван%'

-- Показати інформацію про студентів, в номері яких
-- є три сімки.
-- SELECT *
-- FROM STUDENTS_GRADES
-- WHERE PHONE LIKE '%555%'

-- Показати електронні адреси студентів, що починаються з конкретної літери.
-- SELECT *
-- FROM STUDENTS_GRADES
-- WHERE EMAIL LIKE 'p%'

-- Показати мінімальну середню оцінку по всіх студентах.
-- SELECT MIN(AVERAGE_SCORE) AS MIN_AVERAGE_SCORE
-- FROM STUDENTS_GRADES

-- Показати максимальну середню оцінку по всіх студентах.
-- SELECT MAX(AVERAGE_SCORE) AS MIN_AVERAGE_SCORE
-- FROM STUDENTS_GRADES

-- Показати статистику міст. Має відображатися назва
-- міста та кількість студентів з цього міста.
-- SELECT CITY, COUNT(*) AS STUDENT_COUNT
-- FROM STUDENTS_GRADES
-- GROUP BY CITY

-- Показати статистику студентів. Має відображатися
-- назва країни та кількість студентів з цієї країни.
-- SELECT COUNTRY, COUNT(*) AS STUDENT_COUNT
-- FROM STUDENTS_GRADES
-- GROUP BY COUNTRY

-- Показати кількість студентів з мінімальною середньою
-- оцінкою з математики.
-- WITH MathGrades AS (
--     SELECT 
--         id, 
--         full_name, 
--         city, 
--         country, 
--         birthday, 
--         email, 
--         phone, 
--         group_name, 
--         average_score, 
--         minimum_grade,
--         substring(minimum_grade FROM '\d+$')::int AS math_score
--     FROM STUDENTS_GRADES
--     WHERE minimum_grade LIKE 'Математика%'
-- )

-- SELECT COUNT(*)
-- FROM MathGrades
-- WHERE math_score = (
--     SELECT MIN(math_score) 
--     FROM MathGrades
-- )

-- Показати кількість студентів з максимальною середньою оцінкою з математики
-- WITH MathGrades AS (
--     SELECT 
--         id, 
--         full_name, 
--         city, 
--         country, 
--         birthday, 
--         email, 
--         phone, 
--         group_name, 
--         average_score, 
--         maximum_grade,
--         substring(minimum_grade FROM '\d+$')::int AS math_score
--     FROM STUDENTS_GRADES
--     WHERE maximum_grade LIKE 'Біологія%'
-- )

-- SELECT COUNT(*)
-- FROM MathGrades
-- WHERE math_score = (
--     SELECT MIN(math_score) 
--     FROM MathGrades
-- )

-- Показати кількість студентів у кожній групі.
-- SELECT group_name, COUNT(*) AS student_count
-- FROM STUDENTS_GRADES
-- GROUP BY group_name

-- Показати середню оцінку групи.
SELECT group_name, AVG(average_score) AS average_group_score
FROM STUDENTS_GRADES
GROUP BY group_name
