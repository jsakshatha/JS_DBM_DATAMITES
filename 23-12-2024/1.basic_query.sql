-- this statement is for writing comment

-- 1. create a database for RV COLLEGE

-- create database database_name. press ctrl+enter
create database rv_college_db;

show databases;

create database amazon_db;

create database meesho_db;
show databases;

-- delete the database
drop database meesho_db;

show databases;
drop database amazon_db;

show databases;

-- 2.select the database
use rv_college_db;

-- 3. create table 
create table student_info
(sid int,
sname char(20),
sage int,
sdob date);

-- 4.insert the datas in the table
insert into student_info values
(1,"amit",25,"2001-12-03");

-- view table
select sid,sname,sage,sdob 
from student_info;

select * from student_info;

select sname from student_info;

-- view the table and the column names are sname,sdob
select sname,sdob from student_info;

-- insert multiple values
insert into student_info values
(2,"pallavi",20,"2005-11-21"),
(3,"harshith",18,"2006-09-02"),
(4,"divyani",22,"2003-02-21");

-- view the table and verify that all values is inserted
select * from student_info;

show tables;

-- describe the structure of table
desc student_info;

-- 24-dec-2025

-- press control+enter to execute  the current line
create database microsoft_db;

show databases;

use microsoft_db;

create table employee
(emp_id varchar(10) primary key,
emp_name varchar(25) not null,
emp_salary int,
emp_role varchar(20) not null,
emp_doj date,
emp_age int check(emp_age>18));

insert into employee values
("es001","arun",30000,"hr","2021-03-12",22),
("es002","bhavya",20000,"sales","2020-12-03",24),
("es003","charan",40000,"admin","201-12-12",32),
("es004","diya",15000,"security","2019-12-03",40),
("es005","gagan",60000,"head","2012-03-03",50);

select * from employee;

desc employee;

-- 1. checking the constraint for primary key--error
insert into employee values
("es002","pradeep",25000,"hr","2022-12-22",26);

-- 2. emp_age constraint--error
insert into employee values
("es007","pradeep",25000,"hr","2022-12-22",15);

-- 3.emp_name-not null constraint--error-1364
insert into employee (emp_id,emp_salary,emp_role,emp_doj,emp_age)
values("es008",50000,"hr","2022-12-10",25);

-- 4. emp_doj and emp_salary no constraint
insert into employee (emp_id,emp_name,emp_role,emp_age)
values("es008","sandeep","manager",22);

select * from employee;
-- 29-DEC-2025

-- select the existing database
use microsoft_db;

show tables;

select * from employee;

-- filter the data
-- 1.retreive all the employee details who's age is greater than 35
select *
from employee
where emp_age>35;


-- 2.retreive all the employee name who's salary is greater than 35000
select emp_name
from employee
where emp_salary>35000;

-- 3.retreive all the employee details who's salary>35000 and age>30;
select *
from employee
where emp_salary > 35000 and emp_age > 30;

-- 4.retreive all the employee details who's salary>35000 or age>30;
select *
from employee
where emp_salary > 35000 or emp_age > 30;

-- 5. find the maximum salary
select max(emp_salary) 
from employee;

-- 6. find min salary
-- 7. find avg salary
-- 8.find sum of salary

-- updating the data

-- 5. find average salary
select avg(emp_salary) from employee;

-- 6. find min salary 
select min(emp_salary) from employee;

-- 7. find sum of salary
select sum(emp_salary) from employee;


-- 8.find the number of employees
select count(emp_name) from employee;

select count(*) as no_of_emp
 from employee;

--  updating the data
-- 9. update the age of an employee to 30 who's id is "es002"

update employee
set emp_age=30
where emp_id="es002";

-- verfify by using select command
select * from employee;

-- 10.update the emp_role to "sales" who's id is "es003" and "es004"
update employee
set emp_role="sales" 
where emp_id in ("es003","es004");

-- verfify
select * from employee;

-- note
-- 1.filter on different columns then-- and or works
-- 2filter on same column then-- in (or) or works


-- 11. delete the information about employee gagan

delete from employee
where emp_id="es005";

-- verfiy by using select command
select * from employee;


-- add a new column too the employee table
alter table 
employee 
add emp_exp int;

-- verify
select * from employee;

-- 12.update the experience of an employee to 10 who's age>35

set sql_safe_updates=0;

update employee set emp_exp=10 where emp_age>35;

select * from employee;

-- add multiple columns emp_status,emp_country
set sql_safe_updates=0;

alter table
employee
add emp_status varchar(10),
add emp_country varchar(20);

select * from employee;











