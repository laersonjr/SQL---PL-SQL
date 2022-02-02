--limite de retorno

select * from HR.EMPLOYEES a
where rownum<=5
order by a.SALARY desc;

--exemplo

select a.EMPLOYEE_ID,
       a.FIRST_NAME,
       a.salary
    from HR.EMPLOYEES a
where rownum<=10
order by a.salary desc;


--exemplo

select a.EMPLOYEE_ID,FIRST_NAME,a.salary from HR.EMPLOYEES a
where DEPARTMENT_ID='60'
and rownum<=10
order by a.salary desc;

--exemplo
select a.EMPLOYEE_ID,FIRST_NAME,a.salary ,B.DEPARTMENT_NAME
from HR.EMPLOYEES a
inner join HR.DEPARTMENTS b
on a.DEPARTMENT_ID=b.DEPARTMENT_ID
Where a.DEPARTMENT_ID='60'
and rownum<=10
order by a.salary desc;

select * from senso
where estado like 'Para%'
and rownum <= 500;

-- Forma de usar limit entre linhas
select * from (
    select t.*, row_number() over(order by t.nome_mun) MyRow from senso t
    ) where MyRow between 10 and 20;
