show databases;
create database AddressBook_Service;
use addressbook_service;
create table addressbook (FirstName varchar(10) not null, LastName varchar(10) not null, 
Address varchar(45) not null, City varchar(10) not null, State varchar(10) not null, 
Zip varchar(10) not null, PhoneNo varchar(15) not null, Email_ID char(50) not null);
INSERT INTO addressbook(FirstName, LastName, Address, City, State, Zip, PhoneNo, Email_ID)
 VALUES ('Mayur', 'Pawar', 'Pooja Complex', 'Pen', 'Maharashtra', '402107', '9999999999', 'mayur02@gmail.com');