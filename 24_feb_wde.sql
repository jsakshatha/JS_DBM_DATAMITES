-- DOUBLE HYPEN REPRESENTS COMMENTS

-- step1: view all the databases which is there in the server
-- to execute the current line press ctrl+enter
show databases;

-- step 2: create new database 
-- create database database_name
create database vtu_univeristy_db;

-- step3:verify the database exist or not
show databases;

-- step 4: to view all the tables in the db
show tables;

-- step 5:select the database
-- use database_name
use vtu_univeristy_db;

show tables;


-- create a table called student

create table student
(s_id int,s_name varchar(50),s_age int);

-- verify table exist or not
show tables;

-- insert the data in the table
insert into student values
(1,"amit",17);

-- verify
-- to view complete table along with the data
-- * represents to retreive all the columns in the table

select *  from student;

-- store the data of student who's name is navya and age is 25
insert into student values (2,"navya",25);


-- insert duplicate value for s_id
insert into student values (1,"annapurna",25);


select * from student;

-- delete the database
drop database vtu_university_db;

show databases; 












show databases;

create database app_db;

use app_db;

create table employee
(emp_id varchar(20) primary key,
emp_name varchar(50) not null,
emp_salary int default 20000,
emp_dept varchar(10),
emp_doj date not null,
emp_age int check(emp_age>21));

show tables;
select * from employee;
-- 25 FEB 2026

show databases;

use app_db;

show tables;

select * from employee;
-- insert the multiple records 

insert into employee values
("ES001","AMIT",50000,"HR","2019-12-03",25),
("ES002","BHARAT",25000,"SALES","2020-01-12",30),
("ES003","CHETAN",40000,"IT","2018-02-12",22),
("ES004","DIYA",60000,"IT","2017-03-02",22),
("ES005","JEEVAN",80000,"HR","2019-12-03",25),
("ES006","PRIYA",75000,"SALES","2020-01-12",30),
("ES007","JOY",90000,"IT","2018-02-12",22),
("ES008","RAVI",45000,"FINANCE","2018-02-03",40),
("ES009","TARUN",65000,"FINANCE","2012-02-03",36);

-- verify
select * from employee;
-- check for the primary key constrain
insert into employee values
("ES009","ashwin",65000,"FINANCE","2012-02-03",36);


insert into employee values
("ES010","ashwin",65000,"FINANCE","2012-02-03",36);

-- check for age constraint
insert into employee values
("ES011","drona",65000,"FINANCE","2012-02-03",18);

-- insert data to the specified column
insert into employee(emp_id,emp_name,emp_doj) values
("ES012","SHIVANI","2022-12-12");

-- verfiy the salary data and age data for an employee es012
select * from employee;

-- check the not null constraint
insert into employee(emp_id,emp_doj)values
("ES013","2025-12-12");

-- ALTER COMMAND-- MODIFICATION OF TABLE STRUCTURE,RENAME,CHANGE THE DATA TYPE
-- to change/ modify column, constraint, datatype, renaming ..  anything which is related to table's structure.


-- ADD NEW COLUMN-- emp_gender
alter table employee
add emp_gender varchar(10);

-- verify
select * from employee;

-- multiple column
alter table employee
add emp_status varchar(15),
add emp_state varchar(20);

-- verify
select * from employee;

-- add the the constraint to the existing column


-- delete the column
alter table employee drop column emp_status;

select * from employee;


set sql_safe_updates=0; -- when where updating table without pk,disable safe update mode

-- update the data in gender 
update employee
set emp_gender="NA"
where emp_gender is null;

-- verify it
select * from employee;
describe employee;

alter table employee
modify emp_gender varchar(11) not null;

alter table employee change emp_gender gender varchar(11);

alter table employee rename to employee_info;

select * from employee_info;


-- 26 FEB 2026

show databases;

-- select the database
use app_db;

-- verify table name
show tables;

alter table employee_info rename to employee;

select * from employee;

-- 1.find the maximum salary
select max(emp_salary)
from employee;

-- 2.find the minimum salary-min(field_name)
select min(emp_salary)
from employee;

-- 3.find the average salary-avg(field_name)
select avg(emp_salary)
from employee;

-- 4.find the total salary--sum(field_name)
select sum(emp_salary)
from employee;

-- 5.find the number of employee- count(field_name)
select count(emp_id)
from employee;

-- max,min,avg,sum,count--- aggregate functions

-- 6.find the department names--unique

select distinct emp_dept
from employee;

select * from employee;
-- 7.find the number of employees in each dept

select count(emp_id) as no_of_employees ,emp_dept
from employee
group by emp_dept;

-- 8.find max salary based on dept wise
SELECT max(emp_salary) AS Maximum_salary, emp_dept
FROM   employee
GROUP BY emp_dept;

-- 9.find the total salary in each dept 
SELECT SUM(emp_salary) AS total_salary, emp_dept
FROM   employee
GROUP BY emp_dept;


select max(emp_salary),min(emp_salary),emp_dept
from employee
group by emp_dept;


-- 10 sort the salary in ascending order
select emp_salary
from employee
order by emp_salary asc;

-- 11 sort the salary in descending order usind desc command
select emp_salary
from employee
order by emp_salary desc;









-- 12. fetch the top 3 datas(rows)
select *
from employee
limit 3;

-- 13. fetch last 3 datas(rows)
select * from employee
order by emp_id desc
limit 3;

-- 14.find the details of the employee who's getting highest paid salary

select * 
from employee 
order by emp_salary desc 
limit 1;


-- 15.find the details of the employee who belongs to HR dept 
select * 
from employee
where emp_dept="HR";

-- 16.FIND THE DETAILS OF THE EMPLOYEE WHO'S SALARY IS GREATER THAN 50000
select * 
from employee
where emp_salary >50000;

-- 17.find the details of the employee who belongs to HR dept and salary is morethan 75000
select * 
from employee
where emp_dept="HR" and emp_salary > 75000;

-- 18. find the details of the employee who belongs to HR,SALES
-- solution 1
select *
from employee
where emp_dept="HR" or emp_dept="sales";

-- solution 2
select *
from employee
where emp_dept in ("hr","it");

-- 19.find the details of the employee earning between 20000 to 50000
select * 
from employee
where emp_salary between 20000 and 50000;

-- 20.find the details of the employee who's age is null
select *
from employee
where emp_age is null;

-- 02-March-2026

show databases;

use app_db;

show tables;

select * from employee;

-- 21. find the employee names starts with "A"
-- % represents matching any number of characters
select emp_name
from employee
where emp_name like "A%";

-- 22. find the employee names starts with "j"
select emp_name
from employee
where emp_name like "j%";

-- 23.find the employee name ends with "A"
select emp_name
from employee
where emp_name like "%A";

-- 24. find employee details who doesn't belongs to IT dept

select * 
from employee 
where emp_dept not in ("IT");

select * 
from employee 
where  not emp_dept  ="IT";

select emp_dept
from employe_info
where emp_dept !="IT";

SELECT *
FROM   employee
WHERE  emp_dept NOT LIKE 'IT';

-- 25.find the details of the employee who is maximum salary

-- step 1: find the maximum salary
select max(emp_salary)
from employee;

-- step 2: find the details the employee who salary is 90000
select * from employee where emp_salary = 90000;

-- sub query
select * 
from employee where emp_salary = (select max(emp_salary)
									from employee);

-- 26.find the details of the employee getting more than avg salary
select * 
from employee where emp_salary > (select avg(emp_salary)
									from employee);


-- 27.find the second highest salary-sub queries
-- step 1: find all the employee whos salary is lesser than max salary
select * 
from employee 
where emp_salary < ( select max(emp_salary) from employee );

-- step 2:find all the employee whos salary is lesser than max salary 
-- and arrange it in desecending order.
select * 
from employee 
where emp_salary < ( select max(emp_salary) from employee )
order by emp_salary desc;

-- step 3: for above question fetch the top 1st row
select * 
from employee 
where emp_salary < ( select max(emp_salary) from employee )
order by emp_salary desc
limit 1;




















































