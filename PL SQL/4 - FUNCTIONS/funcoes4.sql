--1) Cria tabelas 
create table notas
(id_aluno int,
 nota1 number,
 peso1 number,
 nota2 number,
 peso2 number,
 media number
 );
 --2 inserindo dados
 
 insert into notas (id_aluno,nota1,peso1,nota2,peso2) values (1,8,4,6,6);
 insert into notas (id_aluno,nota1,peso1,nota2,peso2) values (2,10,4,10,6);
 insert into notas (id_aluno,nota1,peso1,nota2,peso2) values (3,5,4,5,6);
 
 --select
 select * from notas;
 --atualiza
 UPDATE notas SET media=FN_MEDIAPOND(nota1, peso1, nota2, peso2)
 where 1=1;
 
 --verifica

 select * from notas;


-- Exec, criando tabela, insert e function para update
select * from HR.employees;

create table copy_employess (
 copy_employee_id int not null primary key,
 copy_first_last_name varchar2(100),
 copy_salary number,
 perct_aut int,
 new_salary number);
 
 -- Inserindo dados na tabela
 insert into copy_employess (copy_employee_id, copy_first_last_name, copy_salary)
 select employee_id, first_name || ' ' || last_name, salary from HR.employees;
 
 select * from copy_employess;

-- Realizando UPDATE EM TODAS AS LINHAS COM O AUMENTO DE SALÁRIO INFORMADO 
DECLARE
    var_perc copy_employess.perct_aut%TYPE;
    var_id copy_employess.copy_employee_id%TYPE;
    var_qtd_linhas INT;
BEGIN
    var_perc := &var_perc;
    
    SELECT COUNT(*) INTO var_qtd_linhas FROM copy_employess;
    
    FOR X IN 1..var_qtd_linhas LOOP
    
        UPDATE copy_employess SET perct_aut = var_perc, new_salary = FN_NOVO_SAL(var_perc, (SELECT copy_employee_id  FROM (
        SELECT copy_employee_id, ROW_NUMBER() OVER (ORDER BY copy_employee_id asc) as rownumber
        FROM copy_employess) WHERE rownumber = x))
        WHERE copy_employee_id = (SELECT copy_employee_id  FROM (
        SELECT copy_employee_id, ROW_NUMBER() OVER (ORDER BY copy_employee_id asc) as rownumber
        FROM copy_employess) WHERE rownumber = x);
        
    END LOOP;    
END;
