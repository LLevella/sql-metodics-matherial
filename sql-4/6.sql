select * from products;

UPDATE Products
SET Price = Price + 3000;

select * from products;

UPDATE Products
SET Manufacturer = 'Samsung Inc.'
WHERE Manufacturer = 'Samsung';

select * from products;

UPDATE Products
SET Manufacturer = 'Samsung',
    ProductCount = ProductCount + 3
WHERE Manufacturer = 'Samsung Inc.';

select * from products;

