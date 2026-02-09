

create database joins_fk;

use joins_fk;
CREATE TABLE Department (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(30),
location VARCHAR(30)
);
CREATE TABLE Employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(30),
salary INT,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

show tables;

INSERT INTO Department VALUES
(10, 'HR', 'Bangalore'),
(20, 'IT', 'Hyderabad'),
(30, 'Finance', 'Mumbai'),
(40, 'Sales', 'Delhi'),
(50, 'Marketing', 'Pune'),
(60, 'Admin', 'Chennai');


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

select * from Employee;

-- 1: Display employee name and department name (only matching records).

SELECT e.emp_name, d.dept_name
FROM Employee e
INNER JOIN Department d
ON e.dept_id = d.dept_id;


-- Display all employees along with their department names.
SELECT e.emp_name, d.dept_name
FROM Employee e
LEFT JOIN Department d
ON e.dept_id = d.dept_id;


-- Display all departments and their employees.

SELECT e.emp_name, d.dept_name
FROM Employee e
RIGHT JOIN Department d
ON e.dept_id = d.dept_id;

-- Display all possible employee–department combinations.
SELECT e.emp_name, d.dept_name
FROM Employee e
CROSS JOIN Department d;


-- Display employees working in IT department.

SELECT e.emp_name, e.salary
FROM Employee e
JOIN Department d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';


-- Find number of employees in each department.
SELECT d.dept_name, COUNT(e.emp_id) AS emp_count
FROM Department d
LEFT JOIN Employee e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;
