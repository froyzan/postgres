-- Создание базы данных
CREATE DATABASE testdb;

-- Подключение к новой базе данных
\c testdb;

-- Создание таблицы
CREATE TABLE test_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

-- Заполнение таблицы тестовыми данными
DO $$ 
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO test_table (name, age) VALUES 
        (concat('Name_', i), (random() * 100)::int);
    END LOOP;
END $$;

