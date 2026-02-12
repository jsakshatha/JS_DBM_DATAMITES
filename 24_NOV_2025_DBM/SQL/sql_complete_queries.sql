-- TO VIEW THE LIST OF DATABASES
show databases;

-- create a new database for smartquick_db
create database smartquick_db;

-- verify that db is exist or not
show databases;

-- select the database
use smartquick_db;

-- create a table customer
create table customer
(cust_id int primary key,
cust_name varchar(50) not null,
cust_age int check(cust_age>16),
cust_country varchar(20) default "India",
cust_gender varchar(10));

-- verify
show tables;

-- insert the values into the table
insert into customer values
(1,"amit",20,"Sri Lanka","Male");

-- verify
select * from customer;

-- To Retrieve only cust_name and cust_age
select cust_name,cust_age from customer;

insert into customer (cust_id,cust_name,cust_age) values
(2,"abhu",20);

-- insert multiple records together
insert into customer values
(3,"nancy",21,"sri lanka","female"),
(4,"kumar",22,"India","Male");

-- verify
select * from customer;

-- check for primary key constraint: insert duplicate value in cust_id

-- check for not null constraint
insert into customer (cust_id,cust_age) values
(5,20);


-- 3RD FEB 2026
show databases;

use smartquick_db;

show tables;

select * from customer;

-- update the gender who's cust_id is 2
update customer
set cust_gender="Male"
where cust_id=2;

-- verify
select * from customer;

-- update the age of cust_id 3 eg,age=25 new values
update customer 
set cust_age = 25
where cust_id = 3;

-- verify
select * from customer;

--  delete the details of customer who cust_id is 1
delete from customer where cust_id=1;

-- verify by using select
select * from customer;

-- add two columns for the existing table
alter table customer
add cust_status varchar(10),
add cust_remarks varchar(20);

-- verify
desc customer;
select * from customer;

-- update the cust_status as "active" for emp_id 2 and 4
update customer
set cust_status="active"
where cust_id in (2,4);

-- verify
select * from customer;

-- update the cust_remarks as 'none' for emp_name nancy and she is from sri lanka
set sql_safe_updates=0; 

update customer 
set cust_remarks="none" 
where cust_name="nancy" and cust_country="sri lanka";

select * from customer;

-- drop the columns cust_status and cust_remarks
alter  table customer
drop column cust_status,drop column cust_remarks;

-- verify 
desc customer;
-- rename the column name for eg,rename cust_name to customer_name

alter table customer
change column cust_name customer_name varchar(50) not null;


-- verify
select * from customer;

-- rename the table name
alter table customer rename to customer_info;

select * from customer;

select * from customer_info;

start transaction;
update customer_info
set cust_age=45
where cust_id=2;

select * from customer_info;
rollback;

select * from customer_info;


start transaction;
update customer_info
set cust_age=85
where cust_id=4;

-- autorollback if commit is not given 
use smartquick_db;
select * from customer_info;

use employee_query;

select * from employee;

select emp_name,emp_salary from employee;

-- 1. find the department name and the dept name unique
select distinct(dept_name)
from employee;

-- 2. find the maximum salary
select max(emp_salary),emp_name
from employee;

-- min,max,sum,avg,count---- aggrigate function
-- 3. find the number of employees using count function
select count(emp_id)
from employee;

-- 4 FEB 2026
show databases;

use employee_query;


show tables;

select * from employee;

-- 4. find the details of the employee who's getting more than 40000 salary

select * 
from employee 
where emp_salary > 40000;

-- 5.find the details of the employee who's getting salary less than 50000 from IT dept
select * 
from employee 
where emp_salary < 50000 and dept_name = "IT";

-- 6.FIND THE DETAILS OF THE EMPLOYEE WHO BELONGS TO dept  IT and sales
select * 
from employee 
where dept_name = "IT" or dept_name = "Sales";

select * 
from employee
where dept_name in ('IT','Sales');

-- 7.find the datails of the employees who not belongs to IT

select * 
from employee 
where dept_name not in ('IT');

select * from employee
where dept_name !='IT';

select * from employee
where not dept_name ='IT';

-- 8.find the number of employees in each dept
select count(emp_id) as No_of_employee,dept_name
from employee
group by dept_name;

-- 9.find the maximum salary in each dept
select dept_name, MAX(emp_salary) as Max_Salary 
from employee
group by dept_name;

-- 10.find the total salary in each dept
select dept_name, sum(emp_salary) as total_Salary 
from employee
group by dept_name;


select emp_name as name_of_employee
from employee;


select * ,emp_name as name_employee from employee;

-- 11.find the top 3 rows in the employee table
select *
from employee
limit 3;


-- 12. sort the emp_salary in ascending order
select * 
from employee
order by emp_salary asc;

-- 13. sort the emp_salary in descending order by using desc

select * 
from employee
order by emp_salary desc;



-- 14.find the details of the employee who is getting max salary;
-- solution 1
select *
from employee 
order by emp_salary DESC 
limit 1;

-- solution 2
select *
from employee 
where emp_salary=90000;

-- solution 3
select *
from employee 
where emp_salary=(select max(emp_salary) from employee);

select *
from employee 
where emp_salary IN (select max(emp_salary) from employee);

insert into employee values(112,"akshatha","IT",90000);

-- 15.FIND THE SECOND HIGHEST SALARY
select max(emp_salary)
from employee 
where emp_salary < (select max(emp_salary) from employee);

-- 16. FIND THE DETAILS OF THE EMPLOYEE GETTING SECOND HIGHEST SALARY


select * from 
employee where emp_salary 
= (select max(emp_salary)
from employee where emp_salary < (select max(emp_salary) from employee));

-- 5 feb 2026

show databases;

use employee_query;

-- check the table employee is present
show tables;

select * from employee;

-- find the details of the employees who is getting salary more than average salary
select * 
from employee 
where emp_salary > (select avg(emp_salary) from employee);

-- find the details of the employees who's salary range is from 30k to 60k
select * 
from employee
where emp_salary between 30000 and 60000;

-- find the details of the employees working in same department as "Ram"
-- 1. find the department of an employee ram
-- 2. find the employees belongs to HR
select dept_name 
from employee
where emp_name='Ram';

select * 
from employee 
where dept_name = ( select dept_name 
					from employee 
                    where emp_name = "Ram");
                    
-- Find the details of the employee working in departments that have more than two empl

-- find the departments where it has more than two employee
select dept_name
from employee
group by dept_name
having count(emp_id)>2;


SELECT *
FROM employee
WHERE dept_name IN (
    SELECT dept_name
    FROM employee
    GROUP BY dept_name
    HAVING COUNT(emp_id) > 2
);

select * from employee;
-- find the dept name where avg sal>40000
select dept_name ,avg(emp_salary) as avg_sal
from employee 
group by dept_name 
having avg(emp_salary) > 40000;

-- depart name having total sal>1lak
SELECT dept_name
FROM employee
GROUP BY dept_name
HAVING sum(emp_salary) > 100000;

-- pattern matching
-- find the details of the employees who's name starts with "A"
select *
from employee
where emp_name like "a%";  -- starts with a and % any characters

-- find the details of the employees who's name starts with "z"
-- find the details of the employees who's name ends with "A"
select * from employee
where emp_name like '%A';

-- employee name starts with R and atleast it should contain mini 3chars
select * 
from employee
where emp_name like 'R%___' ;  --  _ EXACTLY ONE CHAR 

-- FIND THE EMP_NAME WITH EXACTLY  4 LETTERS
Select * from employee
where emp_name like '____';


-- FIND THE DEPARTMENT NAME STARTS WITH 'H'
Select * from employee
where dept_name like 'h%';

-- INSERT NULL VALUES TO THE EMP_SALARY
INSERT INTO employee VALUES
(113,"nancy","IT",NULL),
(114,"ABHU","HR",NULL),
(115,"SHARWAN","FINANCE",NULL);


SELECT * FROM EMPLOYEE;

-- FIND THE EMP_NAME WHOS SALARY IS NULL
select * from employee where emp_salary IS NULL;

-- FIND THE EMP DETAILS WHO'S SALARY IS NOT NULL
select * from employee where emp_salary is not null;

-- DELETE THE DETAILS OF THE EMPLOYEE WHO'S NAME IS NULL
delete from employee where emp_salary is null;



drop database if exists joins_kf_db;

create database joins_kf_bd;

use joins_kf_bd;

create table department
(dept_id int auto_increment  primary key ,
dept_name varchar(30),
dept_head varchar(50));

create table employee
(emp_id varchar(10) primary key,
emp_name varchar(30),
emp_salary int,
dept_id int,
foreign key(dept_id) references department(dept_id));

show tables;

-- insert the data in department table



insert into department (dept_name,dept_head) values ("HR","Santosh");



select * from department;

-- 9th feb 2026
use joins_kf_bd;

show tables;

desc employee;
desc department;

select * from department;

insert into department(dept_name,dept_head) values("sales","ajay");
insert into department(dept_name,dept_head) values("IT","diya");
insert into department(dept_name,dept_head) values("account","fathima");
insert into department(dept_name,dept_head) values("admin","archana");

select * from department;

insert into department values
(6,'Amit','Sales');

insert into employee values
("EMP001","AKSHATHA",65000,1),
("EMP002","BANU",35000,1),
("EMP003","JOHN",45000,1),
("EMP004","TARUN",65000,NULL),
("EMP005","DIVYA",58000,2),
("EMP006","NAVANITH",95000,2),
("EMP007","SHRAVYA",85000,3),
("EMP008","RANI",75000,NULL),
("EMP009","GAGAN",42000,3),
("EMP010","RAJ",15000,NULL);

SELECT * FROM EMPLOYEE;


insert into employee values
("EMP011","CHARAN",65000,9); -- dept_id 9 doesn't exist in the department in dept


select * from department;

start transaction;
delete  from department where dept_id=3; # dept_id also present in employee
rollback;


start transaction;
delete  from employee where dept_id=3; 
select * from employee;
rollback;

start transaction;
delete  from department where dept_id=3; # dept_id also present in employee
select * from department;
rollback;

insert into employee values
("EMP007","SHRAVYA",85000,3),
("EMP0011","RANI",75000,NULL),
("EMP009","GAGAN",42000,3);


select * from employee;
select * from department;

-- find the departemnt head of the employee akshatha USING WITHOUT JOINS

select dept_head 
from department 
where dept_id = (select dept_id 
				from employee 
                where emp_name = "AKSHATHA");
                
-- METHOD 2 USING JOINS

SELECT d.dept_head
from employee as e
inner join  department as d
on e.dept_id=d.dept_id
where e.emp_name="AKSHATHA";

-- 2. find the details of the employee working in IT dept by using joins
select e.emp_name,d.dept_name,d.dept_head
from employee  as e
inner join
department as d
on e.dept_id=d.dept_id
where d.dept_name='IT';

-- 3. display all the employees along with their dept names
SELECT * 
FROM employee as e 
left join department as d 
on e.dept_id = d.dept_id;

-- 4.display all the dept names along the their emp names
SELECT * 
FROM employee as e 
right join department as d 
on e.dept_id = d.dept_id;

-- find the number of employees in each dept using joins
SELECT  d.dept_name,COUNT(e.emp_id) AS employee_count
FROM department d -- left table
JOIN employee e   -- right table
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT  d.dept_name,COUNT(e.emp_id) AS employee_count
FROM employee e 
JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;


--


-- 10th feb 2026

use joins_kf_bd;

select * from employee;
select * from department;

-- cross join-- to generate all possile combinations
SELECT *
from employee as e
cross join  department as d;

-- union
(select *
from employee as e
left join department as d
on e.dept_id=d.dept_id)
union
(select * 
from employee as e
right join department as d 
on e.dept_id=d.dept_id);


-- 7.show the details of employee who is getting salary more than avg salary in each dept
select * from employee 
where emp_salary > (select avg(emp_salary) from employee);

-- find the avg salary from each depart


select avg(emp_salary),dept_id from employee 
group by dept_id;


-- find the avg salary from each dept using partion by
select *,
avg(emp_salary) over( partition by dept_id) as dept_avg_sal
from employee;

-- find the details of the employee who's getting max salary in each dept using pARTITION BY

-- find the max salary in each dept




select*,
rank() over (partition by dept_id order by emp_salary desc ) as rank_dept
from employee;












-- 11 feb 2026


create database e_commerce_db;

use e_commerce_db;

show tables;

select * from orders;



















SELECT emp_name, emp_salary, dept_id
FROM (
    SELECT
        emp_name,
        emp_salary,
        dept_id,
        AVG(emp_salary) OVER (PARTITION BY dept_id) AS avg_dept
    FROM employee
) sub_table
WHERE emp_salary > avg_dept;

-- find the avg sal in each dept using partiton by
-- find the details of the employees who's more than avg sal from each dept using partition by
select *
from (SELECT  emp_name,
        emp_salary,
        dept_id,
        AVG(emp_salary) OVER (PARTITION BY dept_id) AS avg_dept
    FROM employee) as sub_table
where emp_salary >avg_dept;

-- find the deails of the employee who's getting max salary in each dept using rank() partition b

-- sub question:find the rank of each employee based on the highest rank
select emp_name,emp_salary,dept_id
from (select *,
	  rank() over(partition by dept_id order by emp_salary desc) as rank_dept
	  from employee) as sub_table
where rank_dept=1;

-- find the running total salary (dept-wise)
select *,
sum(emp_salary) over(partition by dept_id order by emp_id) as running_salary
from employee;



















