CREATE TABLE Products
 (
     Id SERIAL PRIMARY KEY,
     ProductName VARCHAR(30) NOT NULL,
     Manufacturer VARCHAR(20) NOT NULL,
     ProductCount INTEGER DEFAULT 0,
     Price NUMERIC
);

INSERT INTO Products VALUES (1, 'Galaxy S9', 'Samsung', 4, 63000);

INSERT INTO Products (ProductName, Price, Manufacturer) 
VALUES ('iPhone X', 71000, 'Apple');

INSERT INTO Products  (ProductName, Manufacturer, Price, ProductCount)
VALUES
('iPhone 6', 'Apple', 3, 36000),
('Galaxy S8', 'Samsung', 2, 46000),
('Galaxy S8 Plus', 'Samsung', 1, 56000);

INSERT INTO Products 
(ProductName, Manufacturer, Price, ProductCount) 
VALUES('Desire 12', 'HTC', 8, 21000) RETURNING id;