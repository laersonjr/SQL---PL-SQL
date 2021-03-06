--criar view que traga as informaçõe dos funcionarios, salario,departamentos

create or replace view v_func_depto
as
select a.EMPLOYEE_ID,
       a.FIRST_NAME,
       a.SALARY,
       a.DEPARTMENT_ID,
       b.DEPARTMENT_NAME
from HR.EMPLOYEES a
inner join hr.DEPARTMENTS b
on a.DEPARTMENT_ID=b.DEPARTMENT_ID;

select * from v_func_depto
where DEPARTMENT_ID='20';

create or replace view v_senso_uf
as
select a.estado, b.sigla_uf,
    sum(case when a.ano=2010 then a.ano end) as ANO_2010,
    sum(case when a.ano=2011 then a.ano end) as ANO_2011,
    sum(case when a.ano=2012 then a.ano end) as ANO_2012,
    sum(case when a.ano=2013 then a.ano end) as ANO_2013,
    sum(case when a.ano=2014 then a.ano end) as ANO_2014
from senso a 
    inner join uf b
    on a.estado = b.estado
group by a.estado, b.sigla_uf;

select * from v_senso_uf;
select * from v_senso_uf where sigla_uf = 'PB';


--atualizando a view
create or replace view v_func_depto
as
select a.EMPLOYEE_ID,
       a.FIRST_NAME as primeiro_nome,
       a.LAST_NAME as ultimo_nome,
       a.SALARY,
       a.DEPARTMENT_ID,
       b.DEPARTMENT_NAME
from HR.EMPLOYEES a
inner join hr.DEPARTMENTS b
on a.DEPARTMENT_ID=b.DEPARTMENT_ID;


-- usando a view
select * from v_func_depto
where DEPARTMENT_ID='20';

-- paises, location e regios
create or replace view v_pais_regiao
as
select a.COUNTRY_ID,a.COUNTRY_NAME,a.REGION_ID,b.REGION_NAME
from HR.COUNTRIES a
inner join HR.REGIONS b
on a.REGION_ID=b.REGION_ID;

--usando a view 
select * from v_pais_regiao where region_name<>'Europe';

--reutilizado a view

select region_name,count(*) qtd 
from v_pais_regiao
group by region_name;

-- Criando view exercicio
create or replace view v_hr_tables
as
select concat(a.first_name, (' '||a.last_name)) as Nome_Completo,
    a.salary, a.hire_date, b.job_title, b.min_salary, b.max_salary,
    c.department_name, d.street_address, d.city, e.country_name, f.region_name
from hr.employees a
    inner join hr.jobs b on a.job_id = b.job_id
    left join HR.departments c on a.department_id = c.department_id
    inner join HR.locations d on c.location_id = d.location_id
    inner join HR.countries e on d.country_id = e.country_id
    inner join HR.regions f on e.region_id = f.region_id;

select * from v_hr_tables where region_name = 'Europe';


-- reutilizando view  e gerando outra view
create  view  v_pais_local
as
select a.LOCATION_ID,a.CITY,b.COUNTRY_NAME
from hr.locations a
inner join v_pais_regiao b
on a.COUNTRY_ID=b.COUNTRY_ID;

-- usando a view

select * from v_pais_local where country_name<>'Italy';

-- criando views com union all
create view v_depto_union
as
select a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY,a.DEPARTMENT_ID,b.DEPARTMENT_NAME
from HR.EMPLOYEES a
inner join hr.DEPARTMENTS b
on a.DEPARTMENT_ID=b.DEPARTMENT_ID
where a.DEPARTMENT_ID='10'

union all

select a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY,a.DEPARTMENT_ID,b.DEPARTMENT_NAME
from HR.EMPLOYEES a
inner join hr.DEPARTMENTS b
on a.DEPARTMENT_ID=b.DEPARTMENT_ID
where a.DEPARTMENT_ID='20'

union all
select a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY,a.DEPARTMENT_ID,b.DEPARTMENT_NAME
from HR.EMPLOYEES a
inner join hr.DEPARTMENTS b
on a.DEPARTMENT_ID=b.DEPARTMENT_ID
where a.DEPARTMENT_ID not in ('10','20');

-- usando a view
select * from v_depto_union;

-- criar view de historico de funcionario

-- verificando se algum funcionario nao tem historico

select * from HR.EMPLOYEES
where EMPLOYEE_ID not in (select EMPLOYEE_ID from HR.JOB_HISTORY);

--verificando os empregados tem historico
select * from HR.EMPLOYEES
where EMPLOYEE_ID  in (select EMPLOYEE_ID from HR.JOB_HISTORY);



select * from hr.JOB_HISTORY
where EMPLOYEE_ID='101'

select  * from HR.EMPLOYEES
where EMPLOYEE_ID='101';


-- criando a view de historico de funciorios/ usando union all
create or replace view v_hist_func
as
--selectionando informações do historico
select a.EMPLOYEE_ID,
       b.FIRST_NAME,
       a.START_DATE,
       a.END_DATE,
       a.JOB_ID,
       c.JOB_TITLE, 
       a.DEPARTMENT_ID,
       d.DEPARTMENT_NAME
from hr.JOB_HISTORY a
inner join hr.EMPLOYEES b
on a.EMPLOYEE_ID=b.EMPLOYEE_ID
inner join hr.JOBS c
on a.JOB_ID=c.JOB_ID
inner join HR.DEPARTMENTS d
on a.DEPARTMENT_ID=d.DEPARTMENT_ID
--where a.EMPLOYEE_ID='101'

union all
-- selecionando dados atuais
select a.EMPLOYEE_ID,
       a.FIRST_NAME,
       (select max(b.END_DATE)+1 from hr.JOB_HISTORY b
           where a.EMPLOYEE_ID=b.EMPLOYEE_ID)as START_DATE,
       sysdate END_DATE,
       a.JOB_ID,
       c.JOB_TITLE,
       a.DEPARTMENT_ID,
       d.DEPARTMENT_NAME
from hr.EMPLOYEES a
inner join hr.JOBS c
on a.JOB_ID=c.JOB_ID
inner join HR.DEPARTMENTS d
on a.DEPARTMENT_ID=d.DEPARTMENT_ID
--where a.EMPLOYEE_ID='101'
order by 1 asc,3 asc;

--consultando view
select * from v_hist_func
where EMPLOYEE_ID='101';




