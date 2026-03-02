create database fk_joins_db;

use fk_joins_db;
CREATE TABLE department (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(30),
dept_head varchar(12)
);
CREATE TABLE employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(30),
salary INT,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

show tables;

INSERT INTO department VALUES
(10, 'HR', 'Bangalore'),
(20, 'IT', 'Hyderabad'),
(30, 'Finance', 'Mumbai'),
(40, 'Sales', 'Delhi'),
(50, 'Marketing', 'Pune'),
(60, 'Admin', 'Chennai');

select * from department;

INSERT INTO Employee VALUES
(101, 'John', 30000, 10),
(102, 'Mary', 45000, 20),
(103, 'Ravi', 50000, 20),
(104, 'Anita', 40000, 30),
(105, 'Suresh', 35000, NULL),
(106, 'Neha', 28000, 10),
(107, 'Arjun', 60000, 20),
(108, 'Kiran', 32000, 40),
(109, 'Pooja', 38000, 50),
(110, 'Amit', 42000, NULL);
