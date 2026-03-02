-- step 1: create the database

create database google_db;

-- writing a comment by using double hypen
-- step 2:how to view all the databases
show databases;

-- step 3:select the database
use google_db;

-- select the database which is not present/exist
use googledb;

-- step 4:show all the tables 
show tables;
create table employee
(emp_id varchar(20) primary key,
emp_name varchar(50) not null,
emp_salary int default 20000,
emp_job varchar(20),
emp_doj date not null,
emp_age int check(emp_age>18));

-- verify the table exist or not
show tables;

-- insert the data 
insert into employee values
("ES001","Abin",50000,"HR","2020-12-01",20);

-- verfiy-- view the complete table
-- * --> all the fields to retreive
select * from employee;

-- view only emp_name,emp_jon and salary
select emp_name,emp_salary,emp_job from employee;

insert into employee values
("ES002","ADITHYA",56000,"FINANCE","2019-08-17",25);

-- VERIFY
select * FROM employee;

-- insert multiple data
insert into employee values
("ES003","RAJEEV",30000,"SALES","2026-01-20",21),
("ES004","PREETI",25000,"SALES","2026-01-25",20),
("ES005","DIYA",20000,"IT","2025-12-12",25);

-- VERIFY
select * from employee;

-- 1.insert the emp details who's age is 5
insert into employee values
("ES006","DIYA",20000,"IT","2025-12-12",05);

-- 2. insert the emp details who's emp_id is "ES001"
insert into employee values
("ES001","DIYA",20000,"IT","2025-12-12",25);

-- insert values to the specified column
insert into employee (emp_id,emp_name,emp_job,emp_doj,emp_age)
values("ES006","FATHIMA","HR","2025-01-02",26);


-- check the salary of fathima
select * from employee;

insert into employee (emp_id,emp_name,emp_doj,emp_age)
values("ES007","sahana","2025-01-02",26);

-- insert the emp details emp_id,emp_doj,emp_age

-- 22 feb 2026
-- check google_db is exist or not
show databases;


-- view all the tables in the db
show tables;

-- select the database
use google_db;

-- view the table 
select * from employee;

-- 1.update the age  of an employee who's empid is "ES003"

update employee
set emp_age=25
where  emp_id="ES003";

-- VERIFY
select * from employee;

-- 2.increase the salary of the employee who's emp_id is "ES001" 

update employee 
set emp_salary=71000 
where emp_id="ES001";

update employee
set emp_salary=75000
where emp_id="ES001";

update employee
set emp_salary=emp_salary+100000
where emp_id="ES001";

SELECT * FROM EMPLOYEE;

-- UPDATE THE AGE OF AN EMPLOYEE WHO BELONGS TO SALES DEPT AND SALARY IS GREATER THAN 25000

set sql_safe_updates=0;

update employee 
set emp_age=30
where  emp_job ="SALES" AND emp_salary>25000;

-- delete the details of the employee who's id is "ES005"

delete from employee
where emp_id="ES005";

-- VERIFY BY USING SELECT
select * from employee;

-- delete the details of the who belongs to "IT" dept
delete from employee
where emp_job="IT";


-- add new two columns  

alter table employee
add emp_gender varchar(10) not null,
add emp_status varchar(10);

select * from employee;

-- update the emp_status is "active"
update employee
set emp_status="Active";


-- update the emp_gender to male for the emp_name abin,rajeev,adithya
update employee
set emp_gender="male"
where emp_name in ("Abin","rajeev", "adithya");

select * from employee;

-- add new column emp_country
alter table employee 
add emp_country varchar(10);


-- drop the column emp_country
alter table employee
drop emp_country;

desc  employee;

-- drop both the columns emp_gender and emp_status
alter table employee 
drop emp_status, drop emp_gender;

desc employee;


-- rename table name to employee_info

alter table employee rename to employee_info;

select * from employee;

select * from employee_info;


-- change column name emp_job to emp_dept
alter table employee_info
change emp_job emp_dept varchar(15);

desc employee_info;


use employee_query;

select * from employee;
-- sql-aggregate functions
-- 1. find the max salary
select max(emp_salary)
from employee;

-- 2.find the minimum salary--min()
select min(emp_salary)
from employee;

-- 3. find the average salary-avg()
select avg(emp_salary)
from employee;


-- 4.find the sum of salary using sum()
select sum(emp_salary)
from employee;

-- 5. find the number of employees(count) by using count
select count(emp_id)
from employee;

-- 6.write the query to find the dept name(unique value)

select distinct dept_name
from employee;

-- 7.find the max salary in each dept

select max(emp_salary),dept_name
from employee
group by dept_name;

-- 8.find the number of employees in each dept
select count(emp_id),dept_name
from employee 
group by dept_name;

select * from employee;

-- 9. find the min salary in each dept
select min(emp_salary),dept_name from employee group by dept_name;

-- 10.sort the salary in ascending order--lowest value-highest values
select *
from employee
order by emp_salary asc;

-- 11.sort the salary in decending order- desc
select *
from employee
order by emp_salary desc;

-- 12.fetch the top 5 rows
select *
from employee
limit 5;

-- 13. fetch the last three rows
select * from employee order by emp_id desc LIMIT 3;

-- 14.fetch the top 3 highest paid employees
select * from employee order by emp_salary desc LIMIT 3;


-- 15.find the details of the employee who belongs to "HR" and "IT"-->same colum
-- solution-1
SELECT *
FROM employee
WHERE dept_name In ("HR","IT");

-- solution-2
select * from employee 
where dept_name ="HR" or dept_name="IT";

-- 16.Find the details of the employee who belongs to sales and salary is more than 30000
select *
from employee 
where dept_name= "sales" and emp_salary>30000;


-- 17.find the details of the employee who not belongs to finance
-- solution -1
select * 
from employee 
where dept_name!= "finance";

-- soultion-2
select * 
from employee 
where dept_name not in ("finance");


-- 18. find the details of the employee earning between 1000 to 40000
select *
from employee
where emp_salary between 1000 and 40000;

-- 19. find the details of the employee,who's name starts with a
-- % matches n number of character
select *
from employee
where emp_name like "a%";


-- 20. find the details of the employee,who's name ends with a
select *
from employee
where emp_name like "%a";

-- 21.find the emp details who's name is having only 4 characters
select *
from employee
where emp_name like "____"; -- 4 times underscore

-- solution -2
select * from employee where length(emp_name) =3;


-- 22.find the details of the employee who is getting max salary

select * from employee
     order by emp_salary desc
     limit 1;



-- 28th feb 2026

show databases;

use employee_query;

show tables;

select * from employee;

-- sub-query

-- find the details of the employee who's getting max salary

-- solution-1
select * from employee order by emp_salary desc limit 1;

-- solution-2 using sub query
select max(emp_salary) from employee;

select *
from employee
where emp_salary=90000;


select *
from employee
where emp_salary=(select max(emp_salary) from employee);

-- 24.find the details of the employee who's salary is more than average salary
select * 
from employee 
where emp_salary>(select avg(emp_salary) from employee);

-- 25.find the details of the employee who is getting second highest salary
-- solution 1
select * from employee
where emp_salary =(select max(emp_salary) 
				  from employee 
                  where emp_salary <(select max(emp_salary) from employee));


-- solution -2
select * 
from employee 
order by emp_salary desc 
limit 1 offset 1;


-- solution 3

-- retrieve the salary details where exclude the max salary
select *
from employee
where emp_salary !=(select max(emp_salary) from employee);

-- from above list fetch the max salary--second highest
select *
from employee
where emp_salary !=(select max(emp_salary) from employee)
order by emp_salary desc
limit 1;



-- 26.find the employees working in the same department as "varun"


-- 1. find the department where varun is working
select dept_name 
from employee 
where emp_name="Varun";

-- fetch all the employees who works SAMe AS varun
select * 
from employee
where dept_name in (select dept_name from employee where emp_name="Varun");

-- 26. find the number of employee in each dept along with display employee names 
select count(emp_id) ,dept_name
from employee
group by dept_name;

-- sql windows
-- performs a calculation across a set of related rows without merging rows

-- select field names,
-- window_function  over( partition by field name order by ..limit) as new_column
-- from table_name

select *,
count(emp_id) over (partition by dept_name) as dept_emp_count
from employee;

select * from employee;

-- rank()
-- rank the employees by salary based on dept wise

select *,
rank() over(partition by dept_name order by emp_salary desc ) as emp_rank
from employee;

select *,
rank() over(order by emp_salary desc) as emp_rank
from employee;
-- working on foregin key and joins
create database fk_joins_db;

use fk_joins_db;
CREATE TABLE department (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(30),
dept_head varchar(12)
);
CREATE TABLE employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(30),
salary INT,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

show tables;

INSERT INTO department VALUES
(10, 'HR', 'Bangalore'),
(20, 'IT', 'Hyderabad'),
(30, 'Finance', 'Mumbai'),
(40, 'Sales', 'Delhi'),
(50, 'Marketing', 'Pune'),
(60, 'Admin', 'Chennai');

select * from department;

INSERT INTO Employee VALUES
(101, 'John', 30000, 10),
(102, 'Mary', 45000, 20),
(103, 'Ravi', 50000, 20),
(104, 'Anita', 40000, 30),
(105, 'Suresh', 35000, NULL),
(106, 'Neha', 28000, 10),
(107, 'Arjun', 60000, 20),
(108, 'Kiran', 32000, 40),
(109, 'Pooja', 38000, 50),
(110, 'Amit', 42000, NULL);

select * from employee;
select * from department;

-- insert the employee details who belongs dept_id 


-- inner join-- which retrieves the common data from both the table


select e.emp_id,e.emp_name,e.dept_id,d.dept_id,d.dept_name
from employee as e
inner join
department as d
on e.dept_id=d.dept_id;


-- display the employee name along with their dept name
-- display all the employees along with their dept name
select e.emp_id,e.emp_name,e.dept_id,d.dept_id,d.dept_name
from employee as e
left join
department as d
on e.dept_id=d.dept_id;

select e.emp_name,d.dept_name
from employee as e
left join
department as d
on e.dept_id=d.dept_id;


select e.emp_id,e.emp_name,e.dept_id,d.dept_id,d.dept_name
from employee as e
right join
department as d
on e.dept_id=d.dept_id;

-- find the employees who is working in IT dept

select  e.emp_name, d.dept_name
from employee as e
inner join
department as d
on e.dept_id = d.dept_id
where d.dept_name="IT";


-- find the no of employees in each dept
select count(*), d.dept_name
from employee as e
inner join
department as d
on e.dept_id=d.dept_id
group by d.dept_name;


-- find the dept head of an employee kiran


-- 1-march-2026

show databases;

use fk_joins_db;

show tables;
select * from employee;
select * from department;

-- find the dept head of an employee kiran

-- find the numbers of employees in hr dept
select count(e.emp_id) from
employee as e
inner join
department as d
on e.dept_id=d.dept_id
where d.dept_name="hr";,

-- find the departments having more than two employees

select  d.dept_name
from employee as e
inner join
department as d
on e.dept_id=d.dept_id
group by d.dept_name
having count(emp_id)>2;

-- find the employee who is not assigned to any of the dept
select * from 
department where dept_id is null;

select * from department;

select e.emp_name,d.dept_id
from employee e
left join 
department d
on e.dept_id=d.dept_id
where d.dept_id is null;


-- find the highest salary in each dept
SELECT MAX(SALARY),dept_name FROM employee s inner join department d
on s.dept_id = d.dept_id GROUP BY dept_name;

-- find the name of the employees starts with letter "A"
select * 
from employee 
where emp_name like "A%";

-- -=========================== SQL QUERIES COMPLETED =====================================
-- response in the chat box--once u have completed sql queries


select * from employee;





-- after importing new table from csv file,number of tales is 3
show tables;
select * from orders;














































-- 26.find the employee who's is getting lowest salary

--





























