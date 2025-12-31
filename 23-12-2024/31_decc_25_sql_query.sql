drop database employee_query;
create database employee_query;
use employee_query;

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




select * from employee;

-- 1. find the number of employees
select count(*) as no_of_employees
from employee;

-- 2.find the department names(unique values)
select distinct(dept_name)
from employee;

-- 3.find the number of departments
select count(distinct(dept_name)) as no_of_departments 
from employee;

-- 4.find the max,min,avg and total salary
select max(emp_salary),min(emp_salary),avg(emp_salary),sum(emp_salary)
from employee;

-- 5. find the number of employees in each dept
select count(*) as no_employees,dept_name
from employee
group by dept_name;

-- 6.sort the employee salary in ascending order
select * 
from employee
order by emp_salary asc;

-- 7.sort the employee salary in descending order
select * from employee order by emp_salary desc;

-- 8.Fetch top 5 rows in employee table-- limit
select * 
from employee
limit 5;

-- 9.fetch last three rows in the employee table
select * from employee
order by emp_id desc
limit 3;

-- 10.fetch top 3 highest paid employees



-- 11.find the number of employees ONLY in Hr dept
select count(*) AS NO_OF_EMPLOYEE from employee
where dept_name="HR";

-- 12.find the max,min,avg,sum of salary from each dept
select dept_name as Department,
max(emp_salary) as Highest_Salary, 
min(emp_salary) as Lowest_Salary, 
avg(emp_salary) as Average_Salary, 
sum(emp_salary) as Total_Salary 
from employee 
group by dept_name;


