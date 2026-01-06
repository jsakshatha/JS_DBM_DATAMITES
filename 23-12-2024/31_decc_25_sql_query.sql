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

-- 6_jan_2026

show databases;

use employee_query;

show tables;

select * from employee;

-- 13.find the details of the employee belongs to Hr dept and salary is greater than 20000
select * 
from employee
where dept_name = "HR" and emp_salary > 20000;

-- 14.find the details of the employee belongs to both "HR" and "IT"
-- solution 1 using or operator
select * from employee where dept_name = "HR" or dept_name = "IT";

-- solution 2 using in operator
select * from employee where dept_name in ( "HR","IT");

-- 15.find the details of the employee EARNING between 20000 and 40000
select * from employee where emp_salary between 20000 and 40000;

-- 16.find the details of the employee who belongs to finance dept or salary>20000
select * 
from employee 
where dept_name = "Finance" or emp_salary > 20000;

-- 17.find the details of the employee ,the employee name starts with "R" using like operator
select *
from employee
where emp_name like "R%";


-- 18.find the details of the employee ,the employee name ends with "m" using like operator
select *
from employee
where emp_name like "%m";

-- 19.find the details of the employee getting maximum salary.

  select max(emp_salary)from employee;

-- solution 1
select* from employee
where emp_salary = 90000;

-- solution 2-- subquery
 select* from employee
 where emp_salary = (select max(emp_salary)from employee);

-- solution 3
SELECT *
FROM employee
ORDER BY emp_salary DESC
LIMIT 1;


-- 20.find the details of the employee who is getting second highest salary
-- solution 1
select * from employee 
where emp_salary<(select max(emp_salary) from employee)
order by emp_salary DESC Limit 1;

-- solution2 
SELECT *
FROM employee
WHERE emp_salary = (
    SELECT MAX(emp_salary)
    FROM employee
    WHERE emp_salary < (SELECT MAX(emp_salary) FROM employee)
);

-- solution 3
select * from employee order by emp_salary DESC Limit 1 offset 1;

-- 21.find the number of employee in each dept along with employee details
select *,
count(*) over (partition by dept_name) as no_of_employee
from employee;

-- 22.find the average salary in each dept along with the emp details using sql windows
select *,
avg(emp_salary) over (partition by dept_name) as avg_salary
from employee;


-- 23.find the rank of employees based on highest salary and it should be dept wise
select *,
rank() over(partition by dept_name order by emp_salary desc) as rank_of_employee
from employee;


-- group by---> only one row per group
select count(*) as count_emp,dept_name
from employee
group by dept_name;


-- over---> 1 row per record

-- 24. find the running total salary--(cummulative sum) for each dept
select *,
sum(emp_salary) over (partition by dept_name order by emp_id) as running_salary
from employee;





















