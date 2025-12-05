
-- create database 
create database bicon_db;

show databases;

-- select the database
use bicon_db;

-- create a table for employee information with constraints
create table emp_info
(emp_id varchar(20) primary key,
emp_name varchar(50) not null,
emp_salary int default 20000,
emp_job varchar(20) not null,
emp_doj date,
emp_age int check(emp_age>20));

show tables;
desc emp_info;
						
insert into emp_info values
("ES001","Amit",25000,"MANGER","2021-12-03",22),
("ES002","BHAVYA",21000,"HR","2022-11-09",23),
("ES003","CHARAN",30000,"SALES","2023-10-03",30),
("ES004","DIYA",40000,"ADMIN","2022-11-09",25);

select * from emp_info;
-- checking the constraint for age field
insert into emp_info values
("ES005","Amit",25000,"MANGER","2021-12-03",15);

-- checking the constraint for primary key-emp_id
insert into emp_info values
("ES001","jigar",25000,"MANGER","2021-12-03",22);

-- check for salary constrain -no error
insert into emp_info(emp_id,emp_name,emp_job,emp_doj,emp_age)
values("ES006","SARAVANAN","Manger","2014-05-08",45);

select * from emp_info;

-- update the age of an employee who's emp_name is Amit
set SQL_SAFE_UPDATES=0;
update emp_info set emp_age=30 where emp_name="Amit";


select * from emp_info;

update emp_info 
set emp_salary=80000 
where emp_name="DIYA" or emp_name="SARAVANAN" ;

delete from emp_info
where emp_id="ES002";









-- check the constraint for emp_job-error
insert into emp_info(emp_id,emp_name,emp_doj,emp_age)
values("ES007","dharshan","2014-05-08",45);

use bicon_db;

-- alter 

select * from emp_info;

desc emp_info;
-- change the datatype of salary to numeric
alter table emp_info
modify emp_salary numeric;

desc emp_info;

-- add new column
alter table emp_info add emp_gender varchar(10);
desc emp_info;

select * from emp_info;
update  emp_info set emp_gender="Female" where emp_name="DIYA";

select * from emp_info;

-- add multiple columns
alter table emp_info
add emp_dept varchar(10),
add emp_status varchar(20);

desc emp_info;

update emp_info set emp_dept="pharmacy",emp_status="full time";
select emp_dept,emp_status,emp_name from  emp_info;

-- drop column
alter table emp_info drop emp_dept;
select * from emp_info;

-- drop multiple columns
alter table emp_info drop emp_gender,drop emp_status;
select * from emp_info;

-- rename table name
alter table emp_info rename to emp_details;
select * from emp_details;
select * from emp_info;

-- ==========================================================
-- part2
-- ===========================================
-- find the max salary
select max(emp_salary)
from emp_details;

-- min,avg,count,sum

-- =====================================================
create database employee_query2;
use employee_query2;

create table employee 
(emp_id int primary key ,emp_name varchar(30) , dept_name varchar(20) , emp_salary int );
insert into employee values
(101 , 'John', 'HR' , 10000),
(201,'Mary','Finance',20000),
(301,'Zara','IT',30000),
(401,'Rida','Sales',50000),
(501, 'Ram','HR',40000),
(601,'Varun','IT',70000),
(701,'Araav','HR',60000),
(801,'Joy','IT',90000),
(302,'Arun','Sales',40000),
(403,'Joe','Finance',35000),
(704,"Dia","Finance",26000);


select * from employee;

-- find number of employees
select count(emp_name)
from employee;

select * from employee;
-- find the details of the employees belongs to the sales dept
select * 
from employee
where dept_name="sales";

-- find the name of the employees belongs to sales dept who's salary is 40000
select emp_name 
from employee
where dept_name="sales"
and emp_salary=40000;

-- find the details of the employees who's salary is less than 40000
select * from employee where emp_salary < 40000;

-- find the salary of dia
select emp_salary from employee where emp_name = "Dia";

-- find the name of the employee who's getting max salary
select max(emp_salary)
from employee;

select emp_name 
from employee
where emp_salary=90000;

select emp_name 
from employee
where emp_salary = (select max(emp_salary) 
					from employee);
                    
select emp_name,emp_salary
from employee 
order by emp_salary desc  limit 1;

-- find the second highest salary
select max(emp_salary) 
from employee
where emp_salary<90000;

select max(emp_salary) 
from employee
where emp_salary<(select max(emp_salary) 
				from employee);
  -- or---              
select emp_name,emp_salary 
from employee 
where emp_salary<(select max(emp_salary) 
				from employee)
order by emp_salary 
desc limit 1; 

-- ===================================================
--           joins the table
-- ===================================================


-- Create database joins

create database joins12;

use joins12;
create table employee
(empid varchar(10) unique , empname varchar(20) , salary int , deptid varchar(10) primary key );
insert into employee values
('E1' ,'John' , 450000 , 'D1') ,
('E2' ,'Mary',73000,'D2'),
('E3' ,'Steve',86000,'D3'),
('E4' ,'Helen',60000,'D4'),
('E5','Joe',35000,'D7');


select * from employee;

-- Create department table
create table department 
(deptid varchar(10) primary key , deptname varchar(10),dept_head varchar(50) );
insert into department values
('D1','HR',"joyal"),
('D2','Admin',"jayant"),
('D3','Sales',"radha"),
('D4','IT',"roshan"),
('D5','HR',"samule");
select * from department;

-- INNER JOIN
select  e.empname ,e.deptid,d.deptid,d.deptname
from employee as e
inner join department as d
on e.deptid=d.deptid;

-- left table is employee
-- right table is department

-- retrives matching data+all data in right table
select  e.empname ,e.deptid,d.deptid,d.deptname
from employee as e
right join department as d
on e.deptid=d.deptid;

-- returns all the rows in left table+matching rows
select  e.empname ,e.deptid,d.deptid,d.deptname
from employee as e
left join department as d
on e.deptid=d.deptid;


-- union join
select  e.empname ,e.deptid,d.deptid,d.deptname
from employee as e
left join department as d
on e.deptid=d.deptid
union
select  e.empname ,e.deptid,d.deptid,d.deptname
from employee as e
right join department as d
on e.deptid=d.deptid;

















