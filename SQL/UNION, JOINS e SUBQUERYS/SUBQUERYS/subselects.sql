-- subselect

-- descobrir todos atores que fizeram o filme com seguintes parametros
-- film_id= 1 com tile= ACADEMY DINOSAUR
-- conhecer a estrura das tabelas alvo


select * from HR.EMPLOYEES;
select * from HR.JOB_HISTORY;
select * from HR.DEPARTMENTS;
select * from HR.JOBS; 


-- EXEMPLO DE SUBSELECT 1 OPERADOR IN 
select * from HR.EMPLOYEES a
where a.employee_id in (select b.employee_id from HR.JOB_HISTORY b where a.department_id = 90); 
                       


-- EXEMPLO DE SUBSELECT 2 OPERADOR IN 
select * from HR.EMPLOYEES a
where a.manager_id='100'
and a.employee_id in (select b.employee_id from HR.JOB_HISTORY b);

-- EXEMPLO DE SUBSELECT 3 OPERADOR IN 
select * from HR.EMPLOYEES a
where  a.employee_id in (select b.employee_id from HR.JOB_HISTORY b
                         where b.DEPARTMENT_ID='50');


--select * from HR.JOB_HISTORY b where b.DEPARTMENT_ID='50'
---
-- EXEMPLO DE SUBSELECT 4 OPERADOR NOT IN 
select * from HR.EMPLOYEES a
where a.employee_id NOT in (select b.employee_id from HR.JOB_HISTORY b); 
                       


-- EXEMPLO DE SUBSELECT 5 OPERADOR NOT IN 
select * from HR.EMPLOYEES a
where a.manager_id='100'
and a.employee_id NOT in (select b.employee_id from HR.JOB_HISTORY b);

-- EXEMPLO DE SUBSELECT 3 OPERADOR NOT IN 
select * from HR.EMPLOYEES a
where  a.employee_id NOT in (select b.employee_id from HR.JOB_HISTORY b
                         where b.DEPARTMENT_ID='50');


--SUBSELECT RETORNANDO COLUNA

SELECT a.employee_id,
       a.first_name,
       a.job_id,
       (select b.job_title from hr.jobs b where a.job_id=b.job_id) as cargo
from HR.EMPLOYEES a;


--SUBSELECT RETORNANDO COLUNA
SELECT a.employee_id,
       a.first_name,
       a.DEPARTMENT_ID,
      (select b.DEPARTMENT_NAME from HR.DEPARTMENTS b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) as Depto
from HR.EMPLOYEES a;

select a.employee_id, a.first_name, a.salary, a.department_id,
    (select b.department_name from HR.departments b where a.department_id = b.department_id) as departamento,
    (select b.location_id from HR.departments b where a.department_id = b.department_id) as location_id
from HR.EMPLOYEES a;


--SUBSELECT RETORNANDO COLUNA
SELECT a.DEPARTMENT_ID,
       a.DEPARTMENT_NAME,
        a.MANAGER_ID,
       (SELECT b.first_name from HR.EMPLOYEES b where a.manager_id=b.employee_id) AS NOME_GER
FROM HR.DEPARTMENTS a;

select * from HR.EMPLOYEES

--SUBSELECT COM VALOR AGREGADO SOMA

SELECT a.DEPARTMENT_ID,
       a.DEPARTMENT_NAME,
       (SELECT SUM(b.salary) from HR.EMPLOYEES b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) salario_depto
FROM HR.DEPARTMENTS a;
 
 
--SUBSELECT COM VALOR AGREGADO SOMA

SELECT a.DEPARTMENT_ID,
       a.DEPARTMENT_NAME,
(SELECT SUM(b.salary) from HR.EMPLOYEES b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) salario_depto,
(SELECT count(*) from HR.EMPLOYEES b   where a.DEPARTMENT_ID=b.DEPARTMENT_ID) qtd_func
FROM HR.DEPARTMENTS a;

select a.department_id, a.department_name,
(select sum(b.salary) from HR.employees b where a.department_id = b.department_id) as salario_departamento,
(select count(*) from HR.employees b where a.department_id = b.department_id) as qtd_func
from hr.departments a;

--SELLECT
SELECT a.DEPARTMENT_ID,
       a.DEPARTMENT_NAME,
--calculo total salario
(SELECT SUM(b.salary) from HR.EMPLOYEES b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) salario_depto,
 --calculo qtd funcioanario
(SELECT count(*) from HR.EMPLOYEES b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) qtd_func,
 --media
CAST((SELECT SUM(b.salary) from HR.EMPLOYEES b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) 
   / --operador matematico
(SELECT count(*) from HR.EMPLOYEES b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) AS DECIMAL(12,2)) media
FROM HR.DEPARTMENTS a;


