CREATE TABLE Customers(
    id serial PRIMARY KEY,
 	FirstName varchar(30),
 	LastName varchar(30),
 	email varchar(30),
 	Age integer
 );

CREATE TABLE OrderLines (
    orderID integer,
    productID integer,
    price money,
    PRIMARY KEY (orderID, productID)
);

