--A diferença entre o  RANK e o DENSE_RANK é que o segundo não salta valores após classificações repetidas.
--usando ROW_NUMBER, cria uma sequência de linhas
--usando NTILLE(x), pega quantidade de linhas e cria uma faixa x
SELECT ROW_NUMBER() OVER (ORDER BY a.SALARY DESC) Sequencia,
        a.FIRST_NAME, 
        a.SALARY, NTILE(4) OVER (ORDER BY a.SALARY DESC) Faixa
FROM    hr.employees a
ORDER  BY a.SALARY DESC;

select ROW_NUMBER() OVER (ORDER BY SUM(a.PIB) DESC) Sequência,
        a.estado, count(a.estado) Qtd_Cidades,
        sum(a.PIB), NTILE(5) OVER (ORDER BY SUM(a.PIB) DESC) Faixa
from senso a
group by a.estado
order by SUM(a.PIB) DESC;

-- usando RANK()
select RANK() OVER(ORDER BY a.SALARY desc) classificacao,
       a.FIRST_NAME,
       a.SALARY
       from hr.employees a
order by a.salary desc;

-- usando RANK() eDENSE_RANK()
-- rank, caso tenha valores iguais na condição, a função rank pula o próximo número
-- dense_rank, caso tenha volres iguais na condição, a função não pula o próximo número
select RANK() OVER(ORDER BY a.SALARY desc) classif_geral,
       DENSE_RANK() OVER(ORDER BY a.SALARY desc) classif_densa,
       a.FIRST_NAME,
       a.SALARY,
       a.JOB_ID 
    from hr.employees a
order by a.salary desc;

--
select RANK() OVER(ORDER BY a.SALARY desc) classif_geral1,
       RANK() OVER(partition by  a.JOB_ID  ORDER BY a.SALARY desc) classif_geral2,
       a.FIRST_NAME,
       a.SALARY,
       a.JOB_ID 
    from hr.employees a
order by a.salary desc;

--
select RANK() OVER(ORDER BY a.SALARY desc) classif_geral,
       RANK() OVER(partition by  a.JOB_ID  ORDER BY a.SALARY desc) classif_densa,
       a.FIRST_NAME,
       a.SALARY,
       a.JOB_ID 
    from hr.employees a
order by a.salary desc;

select rank() over (PARTITION BY a.department_id ORDER BY salary DESC) class_department,
        concat(first_name, (' ' || last_name)) nome_completo,
        salary, b.department_id, b.department_name
from hr.employees a inner join HR.departments b
    on a.department_id = b.department_id
order by salary desc;

select * from hr.employees;

--usando NTILE
SELECT   a.job_title,
         a.MAX_SALARY, NTILE(5) OVER (ORDER BY a.MAX_SALARY DESC) Faixa
FROM    hr.JOBS a
ORDER  BY a.MAX_SALARY DESC;

--usando NTILE
SELECT   a.FIRST_NAME, 
         a.SALARY, NTILE(4) OVER (ORDER BY a.SALARY DESC) Faixa
FROM    hr.employees a
ORDER  BY a.SALARY DESC;




