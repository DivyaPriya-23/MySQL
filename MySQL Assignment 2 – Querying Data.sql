use employee;
select * from employees;

-- Distinct Values
select distinct salary
from Employees;

-- Alias (AS)
select age as Employee_Age, salary as Employee_Salary
FROM Employees;

-- Where Clause & Operators
select * from employees where salary > 50000 and hire_date < '2016-01-01';

update Employees
set designation = 'Data Scientist'
where designation IS NULL;

select * from employees where designation ='Data Scientist';

-- Sorting and Grouping Data
-- ORDER BY
select * from employees order by department_id asc, salary desc;

-- Limit
select * from employees where year(hire_date) =2018 limit 5;

-- Aggregate Functions
select * from departments;
select sum(salary) total_Salary from employees
where department_id = 7;

select min(age) as Minimum_age from employees;

-- GROUP BY
select location_id, MAX(salary) as Maximum_Salary
from Employees
group by location_id;

select designation, avg(salary) as Average_Salary
from Employees
where designation like '%Analyst%'
group by designation;

-- HAVING
select department_id, count(employee_id) as employee_count from employees 
group by department_id having employee_count < 3;

select location_id, avg(age) as Average_Age
from Employees
where gender = 'F'
group by location_id
 having avg(age) < 30;
 
-- Joins
-- Inner Join
select e.employee_name,e.designation, d.department_name from employees as e
inner join departments as d 
on e.department_id = d.department_id;

-- Left Join
select d.department_id, d.department_name,count(e.employee_id) as total_employee 
from departments as d
left join employees as e
on e.department_id = d.department_id
group by d.department_name, d.department_id order by d.department_id ;

-- Right join
select l.location, e.employee_name
from Employees as e
right join Location as l
on e.location_id = l.location_id;






