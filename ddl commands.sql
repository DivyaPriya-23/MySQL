-- Table creation(CREATE)
-- Create DataBase
create Database Employee;
use Employee;

-- Create departments Table
create table departments(
department_id int primary key,
department_name varchar(100) 
);

-- Create Location table
create table location(
location_id int primary key,
location varchar(30)
);

-- Create Employees table
create table employees(
employee_id int Primary key,
employee_name varchar(50),
gender enum('M','F'),
age int,
hire_date date,
designation varchar(100),
department_id int,
location_id int,
salary decimal(10,2)
);

-- Table Alteration(ALTER)

-- Add email column
alter  Table employees
add column email varchar(100);

-- Increase designation column size
alter Table employees
modify column designation varchar(250);

-- Drop age column
alter Table employees
drop column age;

-- Rename hire_date to date_of_joining
Alter Table employees
rename column hire_date to date_of_joining;

-- Rename Tables(RENAME)
Rename table departments to Departments_Info;
rename table location to Locations;

-- Table Truncation(TRUNCATE)
truncate table employees;

-- Database & Table Dropping(DROP)
drop table employees;
drop database employee;



