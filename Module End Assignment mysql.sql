-- database creation elearning
create database elearning;
use elearning;

-- table creation learners
create table learners(
learner_id int Primary Key,
full_name varchar(100),
Country varchar(50)
);

select * from learners;

-- table creation courses
create table courses(
course_id int Primary Key,
course_name varchar(100),
category varchar(50),
unit_price decimal(10,2)
);

-- table creation purchases
create table purchases(
purchase_id int primary key,
learner_id int,
course_id int,
Quantity int,
purchase_date date,
foreign key (learner_id)
references learners(learner_id),
foreign key (course_id)
references courses(course_id)
);

describe purchases;

insert into learners (learner_id,full_name,country)
values 
(1, 'krithi adhiran', 'India'),
(2, 'krishitha', 'India'),
(3, 'Jeya bharathi', 'USA'),
(4, 'raja', 'UK'),
(5, 'murugan', 'Australia');

insert into courses (course_id,course_name, category, unit_price)
VALUES
(101, 'SQL for Beginners', 'Database', 2500.00),
(102, 'Python Programming', 'Programming', 3500.00),
(103, 'Power BI Essentials', 'Data Analytics', 3000.00),
(104, 'Excel Advanced', 'Data Analytics', 2000.00),
(105, 'Web Development', 'Programming', 4000.00);

insert into purchases
(purchase_id, learner_id, course_id, Quantity, purchase_date)
VALUES
(1001, 1, 101, 1, '2026-01-10'),
(1002, 1, 102, 1, '2026-01-15'),
(1003, 2, 103, 2, '2026-01-20'),
(1004, 2, 104, 1, '2026-02-05'),
(1005, 3, 101, 1, '2026-02-10'),
(1006, 3, 103, 1, '2026-02-15'),
(1007, 4, 105, 2, '2026-03-01'),
(1008, 4, 102, 1, '2026-03-05');
 select * from learners;
 select * from courses;
 select * from purchases;
 
 -- Format currency values to 2 decimal places.
 select course_name, format(unit_price,2) as unit_price
 from courses;
 
 -- Use aliases for column names
 select full_name AS learner_name
 from learners;
 
 -- sort results 
 select * from courses
 order by unit_price desc;
 select * from learners
 order by full_name asc;
 -- Data Exploration Using Joins
 -- INNER JOIN
 select l.full_name, c.course_name
 from learners as l
 inner join purchases as p
 on l.learner_id = p.learner_id
 inner join courses as c
 on p.course_id = c.course_id;
 
 -- LEFT JOIN
 select l.full_name, p.purchase_id,P.Quantity, p.purchase_date
 from learners as l
 left join purchases as p
 on l.learner_id = p.learner_id;
 
 -- Right Join 
 select c.course_name, c.category, p.purchase_id, p.Quantity
 from purchases as p
 right join courses as c
 on p.course_id = c.course_id;
 select * from courses;
 -- Display each learner’s purchase details 
 select l.full_name as learner_name, c.course_name, c.category, p.Quantity,
 format(p.Quantity * c.unit_price, 2) as total_amount,
 p.purchase_date
 from learners as l
 inner join purchases as p
 on l.learner_id = p.learner_id
 inner join courses as c 
 on p.course_id = c.course_id
 order by total_amount desc;
 
-- analytical queries

-- Display each learner’s total spending 
select l.full_name, l.Country ,
format(coalesce(sum(p.Quantity * c.unit_price),0),2) as total_spent
from learners as l 
left join purchases as p
on l.learner_id = p.learner_id
left join courses as c
on p.course_id = c.course_id
group by l.learner_id,l.full_name,l.Country
order by total_spent desc;


select * from learners;
select * from purchases;

-- top 3 most purchased courses 
select c.course_id,c.course_name,
SUM(p.Quantity) AS total_quantity_sold
FROM courses c
inner join purchases p
on c.course_id = p.course_id
group by c.course_id, c.course_name
order by total_quantity_sold DESC limit 3;

-- Category-wise Total Revenue
Select c.category,
format (sum(p.Quantity * c.unit_price), 2) as total_revenue,
count(distinct p.learner_id) as unique_learners
from courses c
inner join purchases p
on c.course_id = p.course_id
group by c.category
order by sum(p.Quantity * c.unit_price) desc;

-- Learners who purchased courses from more than one category
select l.learner_id, l.full_name,
count(distinct c.category) as total_categories
from learners l
inner join purchases p
on l.learner_id = p.learner_id
inner join courses c
on p.course_id = c.course_id
group by l.learner_id, l.full_name
having count(distinct c.category) > 1;

-- Identify courses that have not been purchased 
select c.course_id,c.course_name,c.category,c.unit_price
from courses as c
left join purchases as p
    on c.course_id = p.course_id
where p.purchase_id is null;




 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 