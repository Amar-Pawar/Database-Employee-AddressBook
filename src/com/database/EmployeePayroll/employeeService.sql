show databases;
create database payroll_service;
use payroll_service;
create table employee_payroll(id int(4) unsigned auto_increment primary key not null, Employee_Name varchar(15) not null,Salary int(5) not null,Start_Date date not null);
describe employee_payroll;
insert into employee_payroll(Employee_Name,Salary,Start_Date) values('Amar','50000','2020-7-17');
describe employee_payroll;
select * from employee_payroll;
insert into employee_payroll(Employee_Name,Salary,Start_Date) values('Mayur','40000','2020-8-14');
insert into employee_payroll(Employee_Name,Salary,Start_Date) values('Nishad','60000','2019-11-14');
select * from employee_payroll;
select Salary from employee_payroll where Employee_Name = 'Amar';
select Employee_Name from employee_payroll where Start_Date between CAST('2018-1-1' as Date) and date (NOW());
alter table employee_payroll
ADD column Gender varchar(10) not null after Employee_Name;
insert into employee_payroll(Employee_Name,Gender,Salary,Start_Date) values('Monika','Female','45000','2019-9-12');
insert into employee_payroll(Employee_Name,Gender,Salary,Start_Date) values('Sonu','Female','55000','2019-6-27');
SELECT MAX(Salary) FROM employee_payroll
WHERE Gender = 'Female' GROUP BY Gender;
alter table employee_payroll
ADD column PhoneNo varchar(15) not null after Employee_Name;
alter table employee_payroll
ADD column Address varchar(100) not null after PhoneNo;
alter table employee_payroll
ADD column Department varchar(15) not null after Address;
alter table employee_payroll
ADD column Deduction float(15) not null after Salary;
alter table employee_payroll
ADD column TaxablePay float(5) not null after Deduction;
alter table employee_payroll
ADD column IncomeTax float(5) not null after TaxablePay;
alter table employee_payroll
ADD column NetPay float(5) not null after IncomeTax;
use payroll_service;
select * from employee_department;
select * from employee_payroll;
describe employee_payroll;
update payroll_service.employee_payroll set Gender = 'Male' where employee_Name = 'Amar';