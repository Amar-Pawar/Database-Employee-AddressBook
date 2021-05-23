show databases;

#create database
create database payroll_service;

#using created database
use payroll_service;

#Creating a table and addimg coloums with respective description
create table employee_payroll(id int(4) unsigned auto_increment primary key not null, Employee_Name varchar(15) not null,Salary int(5) not null,Start_Date date not null);

#describing table
describe employee_payroll;

#inserting data into table
insert into employee_payroll(Employee_Name,Salary,Start_Date) values('Amar','50000','2020-7-17');

#describing table
describe employee_payroll;

#showing content of table
select * from employee_payroll;

#inserting data into table
insert into employee_payroll(Employee_Name,Salary,Start_Date) values('Mayur','40000','2020-8-14');
insert into employee_payroll(Employee_Name,Salary,Start_Date) values('Nishad','60000','2019-11-14');
select * from employee_payroll;

#showung salary of employee by name
select Salary from employee_payroll where Employee_Name = 'Amar';

#showing employees accorfing to join date with cast() now() method
select Employee_Name from employee_payroll where Start_Date between CAST('2018-1-1' as Date) and date (NOW());

#altering the table and aading coloumns
alter table employee_payroll
ADD column Gender varchar(10) not null after Employee_Name;

#adding more data to table
insert into employee_payroll(Employee_Name,Gender,Salary,Start_Date) values('Monika','Female','45000','2019-9-12');
insert into employee_payroll(Employee_Name,Gender,Salary,Start_Date) values('Sonu','Female','55000','2019-6-27');

#showing max salary by gender by grouping
SELECT MAX(Salary) FROM employee_payroll
WHERE Gender = 'Female' GROUP BY Gender;

#altering table and and adding coloumns
alter table employee_payroll
ADD column PhoneNo varchar(15) not null after Employee_Name;
alter table employee_payroll
ADD column Address varchar(100) not null after PhoneNo;
alter table employee_payroll
ADD column Department varchar(15) not null after Address;
alter table employee_payroll
ADD column Deduction float not null after Salary;
alter table employee_payroll
ADD column TaxablePay float not null after Deduction;
alter table employee_payroll
ADD column IncomeTax float not null after TaxablePay;
alter table employee_payroll
ADD column NetPay float not null after IncomeTax;
use payroll_service;
select * from employee_department;
select * from employee_payroll;
describe employee_payroll;

#updating the culoumn by employee name
update payroll_service.employee_payroll set Gender = 'Male' where employee_Name = 'Amar';

#updating the table department for department name add department id
UPDATE `payroll_service`.`department` SET `Department_Name` = 'HR' WHERE (`Department_ID` = '11');
UPDATE `payroll_service`.`department` SET `Department_Name` = 'Marketing' WHERE (`Department_ID` = '22');
UPDATE `payroll_service`.`department` SET `Department_Name` = 'Engineer' WHERE (`Department_ID` = '33');
UPDATE `payroll_service`.`department` SET `Department_Name` = 'Developer' WHERE (`Department_ID` = '44');
UPDATE `payroll_service`.`department` SET `Department_Name` = 'Supervisor' WHERE (`Department_ID` = '50');


#creating bridge table for many to many relationship between department and employee_payroll
#and setting corresponding primary keys as foreign key in brige table 
CREATE TABLE `payroll_service`.`employee_department` (
  `Employee_id` INT NOT NULL,
  `Department_ID` INT NOT NULL,
  INDEX `Employee_id_idx` (`Employee_id` ASC) VISIBLE,
  INDEX `Department_ID_idx` (`Department_ID` ASC) VISIBLE,
  CONSTRAINT `Employee_id`
    FOREIGN KEY (`Employee_id`)
    REFERENCES `payroll_service`.`employee_payroll` (`Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Department_ID`
    FOREIGN KEY (`Department_ID`)
    REFERENCES `payroll_service`.`department` (`Department_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    #inserting data into bridge table to establish many to many relation
    #adding one employee to different departments and reduce redundancy
    insert into employee_department values (1,33);
    insert into employee_department values (1,44);
    
    insert into employee_department values (2,11);
    insert into employee_department values (3,22);
    insert into employee_department values (4,50);
    insert into employee_department values (5,33);
    insert into employee_department values (6,44);
    
    #query to get data by bridge table we created for showing many to many realtion and reduce redundancy in data and get desired data
    select employee_payroll.Employee_id, employee_payroll.Name, employee_payroll.PhoneNo, employee_payroll.salary, department.Department_ID as Department_ID, department.Department_Name as Department_Name
    from employee_payroll join employee_department on (employee_payroll.Employee_id = employee_department.Employee_id)
    join department on (department.Department_ID = employee_department.Department_ID);
    
    
    #ensuring all UC worling fine after new structure
    select count(*) from employee_department where Department_ID = 44;
    
    select * from employee_payroll;
    select Salary from employee_payroll where Name = 'Amar';
    SELECT MAX(Salary) FROM employee_payroll
    WHERE Gender = 'Female' GROUP BY Gender;