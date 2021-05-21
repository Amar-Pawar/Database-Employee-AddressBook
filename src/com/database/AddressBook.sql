show databases;

#creating database addressbook Service
create database AddressBook_Service;

#using database
use addressbook_service;

#creating table
create table addressbook (FirstName varchar(10) not null, LastName varchar(10) not null, 
Address varchar(45) not null, City varchar(10) not null, State varchar(10) not null, 
Zip varchar(10) not null, PhoneNo varchar(15) not null, Email_ID char(50) not null);
INSERT INTO addressbook(FirstName, LastName, Address, City, State, Zip, PhoneNo, Email_ID)
 VALUES ('Mayur', 'Pawar', 'Pooja Complex', 'Pen', 'Maharashtra', '402107', '9999999999', 'mayur02@gmail.com');

#deleting contact in addressbook by name
 delete from addressbook where FirstName = 'Mayur';
 
 #inserting data into addressbook
 INSERT INTO addressbook(FirstName, LastName, Address, City, State, Zip, PhoneNo, Email_ID)
 VALUES ('Nishad', 'Vairagi', 'Chawdi naka', 'Pen', 'Maharashtra', '402107', '9898989898', 'nishad@gmail.com'),
 ('Sagar', 'Pawar', 'Kharghar', 'Mumbai', 'Maharashtra', '4011002', '9876543212', 'sagar@gmail.com');
 
 #showing contacts by city name
 select * from addressbook where City = 'Pen';
 
  #showing contacts by state name
 select * from addressbook where State = 'Maharashtra';
 
 #getting the count in addressbook by  city name
 select count(*) from addressbook where city = 'Pen';
 
  #getting the count in addressbook by  state name
 select count(*) from addressbook where State = 'Maharashtra';
 
 #showing addressbook sorted alphabeticaly by name
 select * from addressbook where city = 'Pen' order by FirstName;