/* LEC 05 --> JOINS */ 
/* Displaying Data from Multiple Tables */

/* Qualifying Ambiguous Column Names
Use table prefixes to qualify column names that
are in multiple tables.  */ 

/* Using JOIN + ON */ 
select e.employee_id , e.first_name , e.email , d.first_name as dependent_name , d.relationship
from 
employees e JOIN dependents d
ON e.employee_id = d.employee_id

/* Three-Way Joins with the ON Clause */
select e.employee_id , e.first_name ,e.phone_number , d.department_name , l.city
from employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id



/* Creating Cross Joins

The CROSS JOIN clause produces the
cross-product of two tables.

This is also called a Cartesian product between
the two tables. */ 

SELECT last_name, department_name
FROM employees
CROSS JOIN departments ;

/* outer joins */
/* left join */
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

/* right join */
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

/* full outer join */
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id;