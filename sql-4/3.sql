CREATE TABLE customers
(
	id serial CONSTRAINT customers_id PRIMARY key,
	Age integer CONSTRAINT customers_age CHECK (Age > 0 and Age < 100),
	FirstName varchar(30) NOT null,
	LastName varchar(30) NOT null,
 	email varchar(30),
 	CONSTRAINT customers_email unique (email)
);