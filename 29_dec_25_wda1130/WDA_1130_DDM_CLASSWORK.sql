create database abc_db;

-- view databases
show databases;

drop database abc_db;

show databases;

create database education_db;

show databases;

use education_db;

create table student_info
(s_id int primary key,
s_name varchar(50) not null,
s_age int check(s_age>18),
s_college varchar(25) default "RV college",
s_dob date);

show tables;
insert into student_info values
(1,"amit",23,"cmr college","2000-12-02");

select * from student_info;

insert into student_info values
(2,"bhavya",25,"cmr college","1999-11-27"),
(3,"Chethan",22,"KVT college","2000-03-03"),
(4,"diya",20,"KVT college","2003-02-23");

-- 1.primary key constraint-error statement
insert into student_info values
(1,"xyz",34,"abc college","2012-12-04");

-- 2. not null constraint-error statement
insert into student_info(s_id,s_age,s_college,s_dob)
values (5,23,"xyz college","2002-01-02");

-- 3.check constraint for age field
insert into student_info values
(6,"john",9,"xyz college","2002-01-02"); 

-- 4. default constraint--no error
insert into student_info (s_id,s_name,s_age,s_dob) values
(7,"ravi",24,"1999-01-02");

select * from student_info;

-- 5.null constraint--no error
insert into student_info (s_id,s_name,s_age,s_college)
values(10,"sahana",25,"KVT college");

select * from student_info;




select * from student_info;



-- 30-12-2025

use education_db;

show tables;

select * from student_info;

-- update the existing data
-- 1.update the age of the student to 30 who's id is 2
update student_info
set s_age=30
where s_id=2;

-- verify by using select command
select * from student_info;

-- 2.update the dob of student who's name is amit and diya
set sql_safe_updates=0;

update student_info
set s_dob="2010-12-12"
where s_name in ("amit","diya");

select * from student_info;
-- 3. update the student dob who belongs to KVT college and 
-- age>24
update student_info
set s_dob="2000-01-01"
where s_college="KVT college" and s_age>24;

select * from student_info;

-- 4.find the students details who belongs to cmr college or 
-- age>23

select *
from student_info
where s_college = "cmr college" or s_age>23;

-- 6. delete the student details who belongs to KVT college

delete from student_info
where s_college="KVT college";

select * from student_info;

-- alter command 
alter table student_info
add s_status varchar(10),
add s_state varchar(15);

select * from student_info;

desc student_info;

update student_info 
set s_status="active",s_state="karnataka";

select * from student_info;

-- drop column
alter table student_info
drop column s_status,drop s_state;

-- verify
select * from student_info;

-- change the field name by using change command
-- change the s_name field to student_name

alter table student_info
change column s_name student_name varchar(50);

desc student_info;

-- chnage the table name to student_details
alter table student_info
rename student_details;

-- verify
select * from student_details;

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












































































