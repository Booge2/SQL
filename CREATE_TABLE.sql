-- CREATE DATABASE StudentsDB;


CREATE TABLE STUDENTS_GRADES (
    id serial PRIMARY KEY,
    FULL_NAME VARCHAR(255),
    CITY VARCHAR(255),
    COUNTRY VARCHAR(255),
    BIRTHDAY DATE,
    EMAIL VARCHAR(255),
    PHONE VARCHAR(20),
    GROUP_NAME VARCHAR(50),
    AVERAGE_SCORE FLOAT,
    MINIMUM_GRADE VARCHAR(255),
    MAXIMUM_GRADE VARCHAR(255)
);

INSERT INTO STUDENTS_GRADES (FULL_NAME, CITY, COUNTRY, BIRTHDAY, EMAIL, PHONE, GROUP_NAME, AVERAGE_SCORE, MINIMUM_GRADE, MAXIMUM_GRADE)
VALUES
    ('Іваненко Іван Іванович', 'Київ', 'Україна', '1998-05-20', 'ivanenko@example.com', '+380123456789', 'Група 101', 4.5, 'Математика 2', 'Історія 4'),
    ('Петренко Олена Петрівна', 'Львів', 'Україна', '1999-07-15', 'petrenko@example.com', '+380987654321', 'Група 102', 4.7, 'Фізика 3', 'Біологія 4'),
    ('Сидоренко Василь Васильович', 'Харків', 'Україна', '1997-12-10', 'sidorenko@example.com', '+380555566666', 'Група 103', 4.9, 'Хімія 3', 'Географія 5');
