use employee_query;








select * from employee;

-- 1.find the number of employees
select count(emp_id)
from employee;

-- 2. find the maximum salary
select max(emp_salary)
from employee;

-- 3. find the minimum salary
select min(emp_salary)
from employee;

-- 31-12-2025
-- select the database

use employee_query_2;

show tables;

select * from employee;

-- 6.find the unique values in dept_name
-- write a query to find the department names

select distinct(dept_name)
from employee;

-- 7.find the number of employees in each dept

select count(emp_id),dept_name
from employee
group by dept_name;

-- 8.fnd the maximum salary in each department
select max(emp_salary),dept_name
from employee
group by dept_name;

-- 9.find the number of departments(count unique value of dept_name)
select count(distinct(dept_name)) as number_of_depts
from employee;
-- 10. sort the salary by ascending order
select *
from employee
order by emp_salary asc;

-- 11.sort the salary by descending order by using desc
select *
from employee
order by emp_salary desc;
-- 12.fetch 1st three rows in the employee table
select *
from employee
limit 3;

-- 12.fetch last three rows in the employee table
select * from employee order by emp_id desc limit 3;

-- 13.fetch top 3 highest paid employees
select * from employee order by emp_salary desc limit 3;

-- 14.find the details of the employee in HR dept and 
--  salary is more than 20000
select * from employee
where emp_salary>20000 and dept_name="HR";

-- 15.find the details of the employee belongs to HR and IT
select * from employee where dept_name in ("HR","IT");

-- solution-2 using or operator
select * from employee where dept_name="HR" or dept_name="IT";

-- 16.find the details of the employee earning between 20000 and 40000
select *
from employee
where emp_salary between 20000 and 40000;

-- 17.find the names of the employee starts with 'R' using like operator
select *
from employee
where emp_name like "R%";


-- 18. find the details of the employee getting maximum salary
select * from employee order by emp_salary desc limit 1;

-- solution 2
 select * from employee where emp_salary=90000;
 
select * from employee 
where emp_salary=(select max(emp_salary) from employee);

-- 19.find the details of the employees who's getting salary 
-- more than average salary
 select * from employee 
where emp_salary>(select avg(emp_salary) from employee);


-- 20. second highestsalary
select * from employee
where emp_salary <(select max(emp_salary) from employee)
order  by emp_salary desc
limit 1;

-- 5-jan-2026
use employee_query_2;

show tables;

select *from employee;

-- find the number of employees in each dept
select count(emp_id),dept_name
from employee 
group by dept_name;

-- 21. find the number of employees in each dept along with employee details 
select emp_id,emp_name,dept_name,count(*) 
over ( partition by dept_name) as emp_count_per_dept
from  employee;

-- 22.find the average values of salary in each dept using sql window
select *,avg(emp_salary)
over (partition by dept_name) as average_salary
from employee;

-- 23. Rank employees by salary(dept-wise)
select emp_name,dept_name,emp_salary,
rank() over( partition by dept_name order by emp_salary desc) as salary_rank
from employee;

-- 24. find the running total salary (dept-wise)
select emp_name,dept_name,emp_salary,
sum(emp_salary) over(partition by dept_name order by emp_id) as running_salary
from employee;

-- 25.insert data of smitha belongs to HR dept and salary is 45000,emp_id=901

insert into employee values
(901,"smitha","HR",45000);

-- VERIFY
select * from employee;

-- 26.insert new employee details and name of employee is null value 
insert into employee values
(111,NULL,"sales",25000);

-- VERIFY
select * from employee;

-- 27.insert three new employee details who's value is NULL
insert into employee values
(112,null,"HR",23000),
(113,null,"sales",24000),
(114,null,"IT",35000);

-- VERIFY
select * from employee;

-- 28. FILTER NULL VALUES IN emp_name
select *
from employee
where emp_name is null;














