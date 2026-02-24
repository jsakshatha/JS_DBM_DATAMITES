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




