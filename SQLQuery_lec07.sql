 /* Lecture 7  -- Set operators */ 
 
 /* Union -> Combines results of two queries and removes duplicates */
SELECT department_id FROM employees
UNION
SELECT manager_id FROM employees;

/* Union All -> Includes duplicates , shows everything from columns mentioned */
SELECT department_id FROM employees
UNION ALL
SELECT manager_id FROM employees;

/* Intersect -> Returns common values from both queries */
SELECT department_id FROM employees
INTERSECT
SELECT manager_id FROM employees; /* nothing in common */


/* Minus or EXCEPT -> Returns values in first query NOT present in second */
SELECT department_id FROM employees
EXCEPT
SELECT manager_id FROM employees;
/* Departments that are not used as manager_id , unchanged since no similaruty */


/* practice Queries */ 
/* Find employees who:
belong to department 6
OR have salary < 5000 */

select * from employees
where department_id = 6
Union 
select * from employees
where salary < 5000

/* Find employees who:
belong to department 9
AND also have salary > 5000 */ 
select * from employees
where department_id = 9
Intersect 
select * from employees
where salary > 5000

/* Employees in department 10 but NOT earning > 10000 */
select * from employees
where department_id = 10
Except 
select * from employees
where salary > 10000
