CREATE DATABASE STUDENT_DB;

USE STUDENT_DB;

CREATE TABLE COURSE(
course_id  int auto_increment primary key,
course_name varchar(50) not null unique);

show tables;

desc course;

create table student(
stud_id varchar(50) primary key,
stud_name varchar(100) not null,
course_id int,
foreign key (course_id) references course(course_id));

-- insert values in the table -course
select * from course;
insert into course (course_name) values("CDS"),("CDE");

select * from course;

insert into student values("DE001","meena",2);
SELECT * FROM STUDENT;
insert into student values("DE002","SAHANA",2);

insert into student values("DE003","DEEPAK",5);
insert into student values("DE001","ROSHAN",2);
insert into student (stud_id,course_id) values("DS001",1);


-- INSERT NEW COURSE CALL CDA
-- INSERT NEW COLUMN(COURSE_HEAD) IN COURSE TABLE
-- IF COURSE IS CDS THEN HEAD IS "Arjun",CDA HEAD IS "FATHIMA",CDE THE HEAD IS "KIRAN" 
-- Task
insert into course (course_name) values("CDA");
-- insert new col
alter table course add column course_head varchar(50);
select * from course;

update course set course_head="Arjun"
where course_name="CDS";


update course set course_head="Fathima"
where course_name="CDA";

update course set course_head="Kiran"
where course_name="CDE";

select * from course;

-- find the head of student whos stud_id is DE001

SELECT c.course_head
FROM Student AS s
JOIN Course AS c
ON s.COURSE_ID = c.COURSE_ID
WHERE s.STUD_ID = 'DE001';

-- STORED PROCEDURE--(FUNCTION)
-- PRE-WRITTEN QUERY OR PRE SAVED SQL 
-- BLOCK OF QUERY WHICH ARE USED REPEATEDLY

-- create stored procedure to see student table info
call get_student_info();  

-- create stored procedure to view course table
call get_course_info();

-- create stored procedure to inser the data

call add_course("CBS","GAGAN");
call get_course_info();

-- CREATE STORED PROCEDURE TO INSERT STUDENTS DETAILS IN STUDENT TABLE
CALL add_student_details("CB001","RESHMA",4);
call get_student_info(); 

-- INSERT 5 STUDENTS WHO BELONGS TO CDA--COURSE_ID IS 3
CALL add_student_details("CDA001","HARINI",3);
CALL add_student_details("CDA002","JACK",3);
CALL add_student_details("CDA003","AMIT",3);
CALL add_student_details("CDA004","ESTER",3);
CALL add_student_details("CDA005","SAI",3);

call get_student_info();


-- 1.FIND NUMBER OF STUDENTS IN CDA COURSE
-- 2.GET ALL THE INFORMATION ABOUT THE STUDENTS BELONGS TO CDA
 call student_count("CDA");
 
 -- Trigger in sQL
 -- automatic action
 
 -- maintain log history
 -- validate the data
 
 create table stud_log(log_id int auto_increment primary key,
                     student_id varchar(20),action varchar(20), 
                     log_time timestamp default current_timestamp);
 
 delimiter $$
 
create trigger student_insert
after insert on student
for each row
begin
     insert into stud_log(student_id,action)
     values(new.stud_id,"insert");
end
 
 $$
select * from stud_log;
  
call  add_student_details("cby002","john",2);

--
SHOW TABLES;
 
 
 
 
 
 
 
 
 
 
 
 
 

