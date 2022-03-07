-- criando uma procedure para retornar informações

CREATE OR REPLACE PROCEDURE PROC_INF_DEPTO
IS
  CURSOR FUN_CURSOR
  IS
    SELECT a.DEPARTMENT_ID,b.DEPARTMENT_NAME,SUM(salary)SALARIO FROM HR.EMPLOYEES a
    inner join HR.DEPARTMENTS b 
        on a.department_id=b.department_id
    group by a.DEPARTMENT_ID,b.DEPARTMENT_NAME;
    
    FUN_REC FUN_CURSOR%rowtype;
BEGIN
  FOR FUN_REC IN FUN_CURSOR
  LOOP
    dbms_output.put_line('Codigo Depto: ' || FUN_REC.DEPARTMENT_ID || 
     '. Nome Depto: ' ||FUN_REC.DEPARTMENT_NAME || '. Total Salário do Depto: ' ||FUN_REC.salario);
  END LOOP;
  exception
  when others then
  dbms_output.put_line('Erro: '||sqlerrm);
END;
/

--EXECUTANDO
EXECUTE PROC_INF_DEPTO;

SELECT * FROM HR.employees;
SELECT * FROM HR.departments;
SELECT * FROM HR.locations;

CREATE OR REPLACE
PROCEDURE proc_listar_funcionarios
IS
    CURSOR cr_listar_funcionaios
    IS
        select (a.employee_id - 99) as numero,(a.first_name || ' ' || a.last_name) as nome_completo, a.salary 
                as salario, b.department_name as departamento, c.city as cidade
        from HR.employees a
            left join HR.departments b on a.department_id = b.department_id
            left join HR.locations c on b.location_id = c.location_id
            order by numero asc;
    cur_func cr_listar_funcionaios%rowtype;
BEGIN
    FOR cur_func in cr_listar_funcionaios
    LOOP
        dbms_output.put_line(cur_func.numero || ' - Nome: ' || cur_func.nome_completo || 
     '. Nome Depto: ' ||cur_func.departamento || '. Salário: ' ||cur_func.salario
      || ' Cidade: ' || cur_func.cidade);
    END LOOP;
END;
    
EXECUTE proc_listar_funcionarios;