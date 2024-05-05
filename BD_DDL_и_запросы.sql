CREATE TABLE IF NOT EXISTS Client (
    Client_ID SERIAL PRIMARY KEY,
    Name VARCHAR(256) NOT NULL,
    Surname VARCHAR(256) NOT NULL,
    Phone_number VARCHAR(20) NOT NULL,
    Address VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS Orders (
    Order_ID SERIAL PRIMARY KEY,
    Client_ID INT,
    Date_of_order DATE NOT NULL,
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS DeliveryStatus (
    Delivery_ID SERIAL PRIMARY KEY,
    Delivery_status VARCHAR(256) NOT NULL,
    Status_update_date DATE NOT NULL,
    FOREIGN KEY (Delivery_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS DeliveryEmployee (
    Employee_ID SERIAL PRIMARY KEY,
    Name VARCHAR(256) NOT NULL,
    Surname VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS Delivery (
    Delivery_ID SERIAL PRIMARY KEY,
    Employee_ID INT,
    Order_ID INT,
    Date_of_delivery DATE,
    FOREIGN KEY (Employee_ID) REFERENCES DeliveryEmployee(Employee_ID) ON DELETE CASCADE,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS ProductCategory (
    Category_ID SERIAL PRIMARY KEY,
    Category_name VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS Product (
    Product_ID SERIAL PRIMARY KEY,
    Category_ID INT,
    Product_Name VARCHAR(256) NOT NULL,
    Price_per_unit_of_product FLOAT CHECK(Price_per_unit_of_product > 0),
    Product_Description TEXT NOT NULL,
    FOREIGN KEY (Category_ID) REFERENCES ProductCategory(Category_ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ProductOrderLink (
    ID_Communications SERIAL PRIMARY KEY,
    Product_ID INT,
    Order_ID INT
);

CREATE TABLE IF NOT EXISTS OrderContent (
    Order_ID INT,
    Quantity FLOAT CHECK (Quantity > 0),
    Price_per_unit_of_product FLOAT CHECK (Price_per_unit_of_product > 0),
    Price FLOAT CHECK (Price > 0),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);


INSERT INTO Client (Name, Surname, Phone_number, Address) 
VALUES 
    ('Анна', 'Иванова', '123456789', 'Улица Гагарина, дом 1'),
    ('Максим', 'Петров', '987654321', 'Проспект Ленина, дом 5'),
    ('Елена', 'Сидорова', '555555555', 'Улица Пушкина, дом Колотушкина'),
    ('Александр', 'Федоров', '111111111', 'Проспект Гагарина, дом 10'),
    ('Ольга', 'Смирнова', '222222222', 'Улица Лермонтова, дом Чехова'),
    ('Дмитрий', 'Козлов', '333333333', 'Проспект Мира, дом 15'),
    ('Мария', 'Васильева', '444444444', 'Улица Пушкина, дом 20'),
    ('Павел', 'Михайлов', '666666666', 'Проспект Ленина, дом 25'),
    ('Андрей', 'Новиков', '777777777', 'Улица Гагарина, дом 30'),
    ('Татьяна', 'Морозова', '888888888', 'Проспект Гагарина, дом 35'),
    ('Ирина', 'Попова', '999999999', 'Улица Лермонтова, дом 40'),
    ('Сергей', 'Алексеев', '101010101', 'Проспект Мира, дом 45'),
    ('Виктор', 'Соколов', '121212121', 'Улица Пушкина, дом 50'),
    ('Евгения', 'Кузнецова', '131313131', 'Проспект Ленина, дом 55'),
    ('Игорь', 'Игнатов', '141414141', 'Улица Гагарина, дом 60'),
    ('Олег', 'Андреев', '151515151', 'Проспект Гагарина, дом 65'),
    ('Наталья', 'Степанова', '161616161', 'Улица Лермонтова, дом 70'),
    ('Артем', 'Титов', '171717171', 'Проспект Мира, дом 75'),
    ('Екатерина', 'Захарова', '181818181', 'Улица Пушкина, дом 80'),
    ('Роман', 'Белов', '191919191', 'Проспект Ленина, дом 85'),
    ('Анастасия', 'Полякова', '202020202', 'Улица Гагарина, дом 90'),
    ('Владимир', 'Кудрявцев', '212121212', 'Проспект Гагарина, дом 95'),
    ('Дарья', 'Семенова', '222222222', 'Улица Лермонтова, дом 100'),
    ('Алексей', 'Козлов', '232323232', 'Проспект Мира, дом 105'),
    ('Юлия', 'Ковалева', '242424242', 'Улица Пушкина, дом 110'),
    ('Валентин', 'Жуков', '252525252', 'Проспект Ленина, дом 115'),
    ('Надежда', 'Комарова', '262626262', 'Улица Гагарина, дом 120'),
    ('Григорий', 'Орлов', '272727272', 'Проспект Гагарина, дом 125'),
    ('Людмила', 'Романова', '282828282', 'Улица Лермонтова, дом 130'),
    ('Артемий', 'Сергеев', '292929292', 'Проспект Мира, дом 135');


INSERT INTO ProductCategory (Category_name) VALUES
    ('Фрукты и овощи'),
    ('Мясо и рыба'),
    ('Молочные продукты'),
    ('Хлебобулочные изделия'),
    ('Кондитерские изделия');


INSERT INTO Product (Category_ID, Product_Name, Price_per_unit_of_product, Product_Description) VALUES
    (1, 'Яблоки', 1.5, 'Свежие и сочные яблоки'),
    (1, 'Помидоры', 2.0, 'Спелые помидоры'),
    (1, 'Бананы', 2.5, 'Зрелые желтые бананы'),
    (1, 'Морковь', 1.2, 'Свежая морковь'),
    (1, 'Огурцы', 1.8, 'Свежие зеленые огурцы'),
    
    (2, 'Говядина', 15.0, 'Свежая говядина'),
    (2, 'Курица', 8.0, 'Мясо куриной птицы'),
    (2, 'Свинина', 12.0, 'Свежая свинина'),
    (2, 'Лосось', 20.0, 'Свежий лосось'),
    (2, 'Телятина', 18.0, 'Мясо телятины'),

    (3, 'Молоко', 2.0, 'Свежее молоко'),
    (3, 'Сыр', 5.0, 'Натуральный сыр'),
    (3, 'Творог', 3.0, 'Нежный творог'),
    (3, 'Йогурт', 2.5, 'Полезный йогурт'),
    (3, 'Сливки', 4.0, 'Сливки высокого качества'),

    (4, 'Хлеб', 1.0, 'Ароматный свежий хлеб'),
    (4, 'Булочки', 1.2, 'Нежные булочки'),
    (4, 'Пирожные', 2.0, 'Вкусные пирожные'),
    (4, 'Круассаны', 1.5, 'Хрустящие круассаны'),
    (4, 'Багет', 1.8, 'Ароматный багет'),

    (5, 'Шоколад', 3.5, 'Натуральный шоколад'),
    (5, 'Печенье', 2.0, 'Ароматное печенье'),
    (5, 'Мармелад', 1.8, 'Мармелад разных вкусов'),
    (5, 'Конфеты', 4.0, 'Набор разнообразных конфет'),
    (5, 'Вафли', 2.5, 'Хрустящие вафли');

INSERT INTO Orders (Client_ID, Date_of_order) 
VALUES
    (1, '2024-04-01'),
    (2, '2024-04-02'),
    (3, '2024-04-03'),
    (4, '2024-04-04'),
    (5, '2024-04-05'),
    (6, '2024-04-06'),
    (7, '2024-04-07'),
    (8, '2024-04-08'),
    (9, '2024-04-09'),
    (10, '2024-04-10'),
    (11, '2024-04-11'),
    (12, '2024-04-12'),
    (13, '2024-04-13'),
    (14, '2024-04-14'),
    (15, '2024-04-15'),
    (16, '2024-04-16'),
    (17, '2024-04-17'),
    (18, '2024-04-18'),
    (19, '2024-04-19'),
    (20, '2024-04-20'),
    (21, '2024-04-21'),
    (22, '2024-04-22'),
    (23, '2024-04-23'),
    (24, '2024-04-24'),
    (25, '2024-04-25'),
    (26, '2024-04-26'),
    (27, '2024-04-27'),
    (28, '2024-04-28'),
    (29, '2024-04-29'),
    (30, '2024-04-30');


INSERT INTO DeliveryEmployee (Name, Surname) VALUES
    ('Иван', 'Петров'),
    ('Екатерина', 'Иванова'),
    ('Александр', 'Смирнов'),
    ('Ольга', 'Козлова'),
    ('Дмитрий', 'Морозов'),
    ('Анна', 'Новикова'),
    ('Сергей', 'Волков'),
    ('Мария', 'Федорова'),
    ('Алексей', 'Морозов'),
    ('Елена', 'Соколова'),
    ('Михаил', 'Кузнецов'),
    ('Анастасия', 'Васильева'),
    ('Артем', 'Павлов'),
    ('Татьяна', 'Семенова'),
    ('Ирина', 'Голубева');

INSERT INTO Delivery (Employee_ID, Order_ID, Date_of_delivery) VALUES
    (1, 1, '2024-04-20'),
    (2, 2, '2024-04-21'),
    (3, 3, '2024-04-22'),
    (4, 4, '2024-04-23'),
    (5, 5, '2024-04-24'),
    (6, 6, '2024-04-25'),
    (7, 7, '2024-04-26'),
    (8, 8, '2024-04-27'),
    (9, 9, '2024-04-28'),
    (10, 10, '2024-04-29'),
    (11, 11, '2024-04-30'),
    (12, 12, '2024-05-01'),
    (13, 13, '2024-05-02'),
    (14, 14, '2024-05-03'),
    (15, 15, '2024-05-04'),
    (1, 16, '2024-05-05'),
    (2, 17, '2024-05-06'),
    (3, 18, '2024-05-07'),
    (4, 19, '2024-05-08'),
    (5, 20, '2024-05-09'),
    (6, 21, '2024-05-10'),
    (7, 22, '2024-05-11'),
    (8, 23, '2024-05-12'),
    (9, 24, '2024-05-13'),
    (10, 25, '2024-05-14'),
    (11, 26, '2024-05-15'),
    (12, 27, '2024-05-16'),
    (13, 28, '2024-05-17'),
    (14, 29, '2024-05-18'),
    (15, 30, '2024-05-19');

INSERT INTO DeliveryStatus (Delivery_status, Status_update_date) VALUES
    ('Delivered', '2024-04-20'),
    ('In transit', '2024-04-21'),
    ('In transit', '2024-04-22'),
    ('In transit', '2024-04-23'),
    ('In transit', '2024-04-24'),
    ('Out for delivery', '2024-04-25'),
    ('Out for delivery', '2024-04-26'),
    ('Out for delivery', '2024-04-27'),
    ('Out for delivery', '2024-04-28'),
    ('Out for delivery', '2024-04-29'),
    ('Out for delivery', '2024-04-30'),
    ('Out for delivery', '2024-05-01'),
    ('Out for delivery', '2024-05-02'),
    ('Out for delivery', '2024-05-03'),
    ('Out for delivery', '2024-05-04'),
    ('Out for delivery', '2024-05-05'),
    ('Out for delivery', '2024-05-06'),
    ('Out for delivery', '2024-05-07'),
    ('Out for delivery', '2024-05-08'),
    ('Out for delivery', '2024-05-09'),
    ('Out for delivery', '2024-05-10'),
    ('Out for delivery', '2024-05-11'),
    ('Out for delivery', '2024-05-12'),
    ('Out for delivery', '2024-05-13'),
    ('Out for delivery', '2024-05-14'),
    ('Out for delivery', '2024-05-15'),
    ('Out for delivery', '2024-05-16'),
    ('Out for delivery', '2024-05-17'),
    ('Out for delivery', '2024-05-18'),
    ('Out for delivery', '2024-05-19');

INSERT INTO OrderContent (Order_ID, Quantity, Price_per_unit_of_product, Price) VALUES
(1, 2, 1.5, 3.0),
(1, 1, 15.0, 15.0),
(2, 3, 2.0, 6.0),
(2, 2, 8.0, 16.0),
(3, 1, 2.5, 2.5),
(3, 2, 12.0, 24.0),
(3, 1, 2.0, 2.0),
(4, 3, 1.2, 3.6),
(4, 1, 20.0, 20.0),
(4, 2, 5.0, 10.0),
(5, 2, 1.8, 3.6),
(5, 1, 18.0, 18.0),
(5, 1, 3.0, 3.0),
(6, 2, 1.5, 3.0),
(6, 1, 2.5, 2.5),
(6, 3, 1.0, 3.0),
(7, 2, 1.2, 2.4),
(7, 1, 3.5, 3.5),
(8, 2, 2.0, 4.0),
(8, 3, 2.0, 6.0),
(9, 1, 1.5, 1.5),
(9, 2, 1.8, 3.6),
(10, 1, 1.8, 1.8),
(10, 1, 4.0, 4.0);

INSERT INTO ProductOrderLink (Product_ID, Order_ID) VALUES
(1, 1),
(6, 1),
(2, 2),
(7, 2),
(3, 3),
(8, 3),
(11, 3),
(4, 4),
(9, 4),
(12, 4),
(5, 5),
(10, 5),
(13, 5),
(1, 6),
(14, 6),
(16, 6),
(17, 7),
(21, 7),
(18, 8),
(22, 8),
(19, 9),
(23, 9),
(20, 10),
(24, 10);

/*Получить список всех клиентов, отсортированный по фамилии в алфавитном порядке*/
SELECT Name, Surname
FROM Client
ORDER BY Surname;
/*Получить общее количество заказов, сделанных в апреле 2024 года*/
SELECT COUNT(*) AS total_orders
FROM Orders
WHERE Date_of_order BETWEEN '2024-04-01' AND '2024-04-30';
/*Выбрать все продукты с ценой за единицу выше 10 */
SELECT * FROM Product WHERE Price_per_unit_of_product > 10;
/*Выбрать все идентификаторы сотрудников доставки, которые обработали более 3 заказов:*/
SELECT Employee_ID, COUNT(*) AS Order_Count
FROM Delivery
GROUP BY Employee_ID
HAVING COUNT(*) > 3;
/*Получить список заказов, в которых общая сумма превышает 10*/
SELECT Order_ID, Quantity, Price_per_unit_of_product, Price
FROM OrderContent
WHERE Price > 10;
/*Получить список продуктов, которые не были заказаны ни разу*/
SELECT Product.Product_Name, Product.Price_per_unit_of_product, Product.Product_Description
FROM Product
LEFT JOIN ProductOrderLink ON Product.Product_ID = ProductOrderLink.Product_ID
WHERE ProductOrderLink.Product_ID IS NULL;

/*Получить общую сумму всех заказов*/
SELECT SUM(oc.Price) AS Total_Sum
FROM OrderContent oc;
/*Получить список продуктов с ценой за единицу выше средней цены*/
SELECT Product_Name, Price_per_unit_of_product
FROM Product
WHERE Price_per_unit_of_product > (
    SELECT AVG(Price_per_unit_of_product)
    FROM Product
);
/*Получить список заказов, в которых заказывали яблоки(id 1)*/
SELECT DISTINCT Order_ID
FROM ProductOrderLink
WHERE Product_ID = 1;
/*Получить список всех статусов доставки с датами обновления статуса*/
SELECT Delivery_status, Status_update_date
FROM DeliveryStatus;



DROP TABLE client
DROP TABLE orders
DROP TABLE deliveryStatus
DROP TABLE deliveryEmployee
DROP TABLE product
DROP TABLE productOrderLink
DROP TABLE orderContent
DROP TABLE delivery
