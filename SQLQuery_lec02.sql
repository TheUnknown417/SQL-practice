/* limiting the Rows that are SELECTED , using where clause */

/* Simple use of Where */
select *
from jobs
where min_salary = 4000

/*  use of Where with logical operators , <> not equal*/
select * 
from employees
where employee_id >=200

/* Simple use of Where in () and betweenn X and Y */
select first_name , phone_number , salary 
from employees
where salary between 4000 and 15000 

/* Using where with LIKE'' */
select first_name , last_name , email , phone_number
from employees
where last_name LIKE 'a_m%'

/* Using where with IS NULL , AND OR NOT are not used with where  , but separately in next line */
select first_name , last_name , email , phone_number , manager_id
from employees
where phone_number IS NULL 
OR manager_id IS NULL

select * 
from employees
where employee_id NOT IN ('103' , '107')
AND salary > 10000
ORDER BY salary ,job_id     /* ORDER BY [DESC]is used to sort data on one or more attributes */ 