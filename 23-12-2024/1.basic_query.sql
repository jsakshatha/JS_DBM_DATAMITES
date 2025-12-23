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











