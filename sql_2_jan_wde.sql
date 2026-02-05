-- see all the databases
-- ctrl+enter for the execution of sql query
show databases;

-- create new database datamites_database
create database datamites_database;

-- verify
show databases;

-- select the database
use datamites_database;

-- create the table with field name,data type and constraints
create table employee
(emp_id int primary key,
emp_name varchar(50) not null,
emp_salary int default 20000,
emp_doj date,
emp_age int check(emp_age>18));

show tables;

-- decribe about the table
-- desc table_name
desc employee;

-- insert the datas in the table
insert into employee values
(1,"AKSHATHA",25000,"2023-03-12",25);

-- view the table with selected column 
select emp_id,emp_name  from employee;

-- * symbol is for retrieving all columns
select * from employee;
-- insert multiple rows/datas
insert into employee values
(2,"jigar",45000,"2020-12-12",22),
(3,"amit",20000,"2025-12-03",19),
(4,"rohan",65000,"2001-03-04",24);

-- view the complete table
select * from employee;




-- check for the duplicate values in emp_id--primarykey constraint--error
insert into employee values
(1,"sahana",22000,"2025-12-04",25);

-- check for the age constraint--error--age>18
insert into employee values
(5,"sahana",22000,"2025-12-04",15);

-- check for not null constraint--without emp_name--error
insert into employee (emp_id,emp_salary,emp_age) values
(6,30000,35);

-- check for null constraint--without emp_doj--no error--data is inserted
insert into employee (emp_id,emp_name,emp_salary,emp_age) values
(6,"rama",40000,35);

-- verify
select * from employee;

-- check for the default value--emp_salary--no error--insert data
insert into employee (emp_id,emp_name,emp_age) values
(7,"Alam",35);

-- verfiy
select * from employee;

-- find the details of the employee who's emp_id is 3

select *
from employee
where emp_id=3;

-- find the details of the employee who's salary is more than 30000
Select * from employee where emp_salary>30000;

-- find the employee details who age is more than 20 and salary is morethan 25000
select * 
from employee
where emp_age>20 and emp_salary>25000;



-- 29-JAN-2026
show databases;

-- select the database
use datamites_database;

show tables;

select * from employee;


-- update the age of the employee to 30 who's employee id is 2 
update employee
set emp_age=30
where emp_id=2;

-- verify
select * from employee;

-- increase the salary 5000 for the employee id 3

update employee
set emp_salary=emp_salary +5000
where emp_id=3;

select * from employee;

-- delete the details of the employee who's emp id is  3
delete from employee where emp_id=3;

-- verify
select * from employee;

-- delete the details of the employee who's age is less than 25
-- update the age of the employee who's emp_name is jigar

set sql_safe_updates=0;

delete  from employee where emp_age < 25;

update employee set emp_age=35 where emp_name="jigar";

--  add two columns to the existing table

alter table employee
add emp_status varchar(10),
add emp_city varchar(30);

-- verify
select * from employee;

-- update the emp_status is "active"
update employee set emp_status="active";

-- verify
select * from employee;

-- update the city is delhi for the employee name "rama"
update employee
set emp_city='delhi'
where emp_name='Rama';

-- verify
select * from employee;
-- delete the emp_status column

alter table employee
drop column emp_status;

-- verify
select * from employee;

-- rename the emp_name column to name_of_employee
alter table employee change emp_name name_of_employee varchar(50) not null;

-- verify
select * from employee;

-- rename the table from employee to employee_info
alter table employee rename to employee_info;

-- error while using old table name
select * from employee;

-- no error if we use new table name
select * from employee_info;


-- ========================
-- refere sql_query file and execute all commands
-- ======================

use employee_query;


select * from employee;

-- 1.find the department names
select dept_name from employee;

-- 2.find the unique values in the dept_name or find the department names which are uniq
select distinct(dept_name) from employee;

-- 3.find the maximum salary
select max(emp_salary) from employee;

-- 4. find the total number of employees
select count(emp_id) from employee;
 
-- or
select count(*) from employee;

-- 2-FEB-2026
show databases;

use employee_query;

show tables;

select * from employee;

-- 7.find the total or sum of salary
select sum(emp_salary) from employee;

-- 8. find the max salary in each dept 
select max(emp_salary) as max_salary_dept,dept_name
from employee
group by dept_name;

-- 9. find the number of employees in each dept 
select count(emp_id) as total_emp, dept_name 
from employee
group by dept_name;

-- 10 sort the salary in ascending order
select *
from employee
order by emp_salary asc;

-- 11.sort the salary in decending order
select *
from employee
order by emp_salary desc;

-- 12 find the top 3 records/rows
select * 
from employee
limit 3;

-- 13 find the last 3 records/rows
select * 
from employee 
order by emp_id desc
limit 3;

select * from employee;


-- find the details of the employee who is getting max salary

-- solution 1
select * from employee order by emp_salary desc limit 1;

-- solution 2
select *
from employee
where emp_salary in (select max(emp_salary) from employee);

-- solution -3
select *
from employee
where emp_salary = (select max(emp_salary) from employee);

-- 15. find the details of the employee who belongs to HR AND IT dept
--  filter on the same then we can use in/or operator
select * from employee
where dept in ('HR', 'IT');

-- solution-2
select * 
from employee 
where dept_name = "HR" or dept_name = "IT";

-- 16.find the details of the employee who belongs to  HR dept and salary is less than 20000
select * 
from employee 
where dept_name="HR" and emp_salary<20000;

-- 17.find the details of the employee who is getting more than avg salary
select * from employee
where emp_salary > (select avg (emp_salary) from employee);


-- 18.find the details of the employee who is getting second highest salary
select * from employee
where emp_salary < (select max(emp_salary) from employee) 
order by emp_salary desc
limit 1
;

-- solution 2
select * 
from employee
where emp_salary=(select max(emp_salary)
				  from employee 
                  where emp_salary<(select max(emp_salary) from employee));

-- solution 3
select *
from employee
order by emp_salary desc
limit 1 offset 1;

-- 20. find the departarment where employee count is > 2

select dept_name,count(emp_id) as count
from employee
group by dept_name
having count(emp_id)>2;

-- 21. find the departments with avg salary greater than 15000
select dept_name,avg(emp_salary)
from employee
group by dept_name
having avg(emp_salary)>15000;

-- 3 FEB 2026
-- 22 . FIND tthe details of the employee of salary range is from 20000 to 40000

use employee_query;

select *
from employee
where emp_salary between 20000 and 40000;

-- 22. find the details of the employee that employee na starts with letter "a"
select *
from employee
where emp_name like "z%";

-- 22. find the details of the employee that employee name ends with letter "a"
select *
from employee
where emp_name like "%a";


select * from employee;
insert into employee values(901,"abhishek",NULL,85000),(111,"naresh",null,71000);

select * from employee;

-- 24. find the details of the employee where dept_name is null
select * 
from employee
where dept_name is null;

-- 25.find the details of the employee where dept_name is not null
select * 
from  employee 
where not dept_name is null;

select *  from employee where dept_name is not null;

select * from employee;

-- 26.delete the details of employee whos dept name is null
delete from employee where dept_name is NULL;


-- select the database joins

use joins;

select * from employee;
select * from department;







-- display the employee name with department name--(inner join)
select e.empid,e.empname,e.deptid, d.deptid,d.deptname 
from employee as e 
inner join department as d 
on e.deptid=d.deptid;


-- show all the employees even if thy dont belongs to any dept--(left join)
-- left join : returns all the records in left table(employee)+matching records(common)
select e.empid,e.empname,e.deptid, d.deptid,d.deptname 
from employee as e 
left join department as d 
on e.deptid=d.deptid;

-- show all the departments even if thy have no employees--(right join)
-- right  join : returns all the records in right table(department)+matching records(common)
select e.empid,e.empname,e.deptid, d.deptid,d.deptname 
from employee as e 
right join department as d 
on e.deptid=d.deptid;

-- display the names of employees working in IT dept
select e.empname, d.deptname
from employee as e
inner join department as d
on e.deptid = d.deptid
where d.deptname = 'IT';

-- union join-- full outer join
(select e.empname,e.deptid,d.deptid, d.deptname
from employee as e
left join department as d
on e.deptid = d.deptid)
union
(select e.empname,e.deptid,d.deptid, d.deptname
from employee as e
right join department as d
on e.deptid = d.deptid);
-- 4-feb-2026

show databases;

use employee_query;

show tables;

select * from employee;

-- find the number of employees in each dept

select dept_name, count(emp_id)
from employee
group by dept_name;

-- find the number of employees in each dept and also get the employee details

-- windows function syntax: function() over(....)
-- over-- defines the windows of rows used by windows function
-- over-- rows are not merged
select emp_id,emp_name,emp_salary,dept_name,
count(emp_id) over ( partition by dept_name) as no_of_emp
from employee;

-- find the max salary in each dept with employee details
select emp_id,emp_name,emp_salary,dept_name,
max(emp_salary) over ( partition by dept_name) as max_emp_salry
from employee;

-- find the rank of the employees based on the highest salary in each dept
select emp_id,emp_name,emp_salary,dept_name,
rank() over(partition by dept_name order by emp_salary desc) as rank_emp
from employee;

-- find the total running salary from each dept
select emp_id,emp_name,emp_salary,dept_name,
sum(emp_salary) over(partition by dept_name order by emp_id) as total_salary
from employee;

















































































