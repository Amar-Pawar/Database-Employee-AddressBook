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
 
show full tables;

#altering the table and aading coloumns
alter table addressbook
ADD column AddressBookName varchar(45) not null after Email_ID;

#altering the table and aading coloumns
alter table addressbook
ADD column Type varchar(45) not null after AddressBookName;

#updating the culoumn by FirstName
update addressbook set AddressBookName = 'My Contacts' where FirstName = 'Amar' or 'Mayur';

#updating the culoumn by FirstName
update addressbook set AddressBookName = 'Friends Contact' where FirstName = 'Nishad' or 'Sagaar';

#updating the culoumn by FirstName
update addressbook set Type = 'Family' where FirstName = 'Amar' or 'Mayur';

#updating the culoumn by FirstName
update addressbook set Type = 'Friend' where FirstName = 'Nishad' or 'Sagar';

#count the number of persons based on type
select count(*) from addressbook where type = 'Family';

#UC-13
 #showing contacts by city name
 select * from addressbook where City = 'Pen';

#getting the count in addressbook by  city name
 select count(*) from addressbook where city = 'Pen';
 
  #showing addressbook sorted alphabeticaly by name
 select * from addressbook where city = 'Pen' order by FirstName;
 
 #count the number of persons based on typeemployee_payrollemployee_payroll
select count(*) from addressbook where type = 'Family';

#changing the table name
ALTER TABLE `addressbook_service`.`addressbook` 
RENAME TO  `addressbook_service`.`contact` ;

#creating third table for many to many relation
#making foreign key fot corrosponding primary key for establishing relation
CREATE TABLE `addressbook_service`.`contact_addressbook` (
  `Email_ID` CHAR(50) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  INDEX `Email_ID_idx` (`Email_ID` ASC) VISIBLE,
  INDEX `Type_idx` (`Type` ASC) VISIBLE,
  CONSTRAINT `Email_ID`
    FOREIGN KEY (`Email_ID`)
    REFERENCES `addressbook_service`.`contact` (`Email_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Type`
    FOREIGN KEY (`Type`)
    REFERENCES `addressbook_service`.`addressbook_type` (`Type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    #Adding same contact to both friends and family and bridge table takes care of redundancy in data
    insert into contact_addressbook values ('pawaramar.pawar@gmail.com', 'Family');
    insert into contact_addressbook values ('pawaramar.pawar@gmail.com', 'Friends');
    
	insert into contact_addressbook values ('nishad@gmail.com', 'Friends');
	insert into contact_addressbook values ('mayur02@gmail.com', 'Family');
	insert into contact_addressbook values ('sagar@gmail.com', 'Family');
	insert into contact_addressbook values ('swaraj@gmail.com', 'Friends');
    
    #query to get data after establishing many to many relation with bridge by join 
    select contact.FirstName, contact.Email_ID, contact.PhoneNo, addressbook_type.Type as Type, addressbook_type.AddressBookName
    as AddressBookName from contact join contact_addressbook on
    (contact.Email_ID=contact_addressbook.Email_ID) join addressbook_type on 
    (addressbook_type.Type = contact_addressbook.Type);
    