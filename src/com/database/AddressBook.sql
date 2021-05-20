show databases;
create database AddressBook_Service;
use addressbook_service;
create table addressbook (FirstName varchar(10) not null, LastName varchar(10) not null, 
Address varchar(45) not null, City varchar(10) not null, State varchar(10) not null, 
Zip varchar(10) not null, PhoneNo varchar(15) not null, Email_ID char(50) not null) 