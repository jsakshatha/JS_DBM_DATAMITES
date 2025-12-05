show databases;

use datamites_sql;

-- To get multiple table info in single query
select * from products,emp;

-- retrive furniture details
select * from products where category="furniture";

-- retrive info on either of the condition-category="Technology" or sub_category="phones"
SELECT *
FROM products
WHERE category = 'furniture'
OR sub_category = 'tables';
-- and logical operator

SELECT *
FROM products
WHERE category = 'furniture'
and sub_category = 'tables';
-- find the unique values in the category col
select distinct category from products;

-- in operator 
select * from products where category in ("furniture","Technology");

select distinct category from products;

-- retrieve info about emp about job=sales,mangers
select * from emp where job in ('sales', 'manager');


-- between operator- salary details of employess who sal value is from 500 to 1200 
select * from emp where sal between 500 and 1200;

-- like operator
select * from emp;
-- retreive the emp details whos name ends with 'R'
select * from emp where ename like "%R";

select * from emp where ename like "K%";

select * from emp where ename like "M%R";


show databases;
use datamites_sql;
show tables;

select * from emp;
select * from orders;

-- where condition

select * from emp where job="salesman";

select ename,job from emp where job="salesman";

-- unique value
select distinct job from emp;

-- ORDER BY
select * from emp order by sal;
select * from emp order by sal desc;

-- check the null values
select * from emp where comm is null;

select max(sal) from emp where comm is not null;

-- between operator 
select * from emp where sal between 750.0 and 2000.0;

select * from products;

select * 
from products
where category="Furniture" and sub_category="Chairs";

select * 
from products
where category="Furniture" or sub_category="Chairs";






