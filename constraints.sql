-- Recreate Database
Create Database employee;
use employee;

create table departments(
department_id int primary key,
department_name varchar(100) not null unique
);

create table location(
location_id int auto_increment primary key,
location varchar(30) not null unique
);

create table employees(
employee_id int Primary key,
employee_name varchar(50) not null,
gender enum('M','F'),
age int check (age >=18),
hire_date date default (current_date),
designation varchar(100),
department_id int,
location_id int,
salary decimal(10,2)
);
Alter Table employees
Add constraint fk_department
foreign key (department_id)
references departments(department_id);

Alter Table employees
add constraint fk_location
foreign key (location_id)
references location(location_id);
SHOW CREATE TABLE Employees;

